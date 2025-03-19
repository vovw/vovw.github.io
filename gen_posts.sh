#!/bin/bash

# Create a blog index page
create_blog_index() {
    echo "Generating blog index page..."
    cat > blog.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atharva - Blog</title>
    <meta name="description" content="Atharva's blog">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <header>
            <div class="profile">
                <a href="index.html">
                    <img src="https://ext.same-assets.com/1366275312/2515812568.jpeg" alt="Atharva's photo" class="profile-img">
                    <h1 class="site-title">ATHARVA</h1>
                </a>
            </div>
            <nav class="nav-links">
                <a href="index.html" class="nav-link">about</a>
                <a href="blog.html" class="nav-link active">blog</a>
                <a href="uses.html" class="nav-link">uses</a>
                <a href="media.html" class="nav-link">media</a>
            </nav>
        </header>

        <main>
            <section class="content">
                <h2 class="section-title">blog</h2>
                <ul class="blog-list">
EOF

    # Get list of markdown files, sort by modification time (newest first)
    for md_file in $(find md -name "*.md" -type f | sort -r 2>/dev/null); do
        filename=$(basename "$md_file" .md)
        # Skip "uses" and "media" files as they have dedicated pages
        if [ "$filename" = "uses" ] || [ "$filename" = "media" ] || [ "$filename" = "people" ]; then
            continue
        fi
        
        # Extract title and date with better handling
        title=$(head -n 1 "$md_file" | sed 's/^# //')
        date=$(grep -m 1 "Date:" "$md_file" | sed 's/Date: //' || echo "")
        
        # Add entry to blog list
        echo "                    <li><a href=\"${filename}.html\" class=\"blog-link\">${title}</a> <span class=\"post-date\">${date}</span></li>" >> blog.html
    done

    # Close the HTML file
    cat >> blog.html << EOF
                </ul>

                <div class="social-links">
                    <a href="https://x.com/k7agar" class="social-link">x/k7agar</a>
                    <a href="https://github.com/vovw" target="_blank" class="social-link">git</a>
                    <a href="https://www.youtube.com/@wtfvoidz" target="_blank" class="social-link">tube</a>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
EOF
    echo "Blog index page created successfully!"
}

# Fix markdown files to have proper metadata
fix_markdown_files() {
    echo "Fixing markdown files formatting..."
    
    for md_file in md/*.md; do
        if [ -f "$md_file" ]; then
            base_name=$(basename "$md_file" .md)
            temp_file=$(mktemp)
            
            # Check if file already has Date and Description tags
            has_date=$(grep -m 1 "^Date:" "$md_file" || echo "")
            has_desc=$(grep -m 1 "^Description:" "$md_file" || echo "")
            
            # Get the title from first line
            title=$(head -n 1 "$md_file" | sed 's/^# //')
            
            # Create a properly formatted markdown file with metadata
            echo "# $title" > "$temp_file"
            echo "" >> "$temp_file"
            
            # Add date if not present
            if [ -z "$has_date" ]; then
                echo "Date: Mar 19, 2025" >> "$temp_file"
            fi
            
            # Add description if not present
            if [ -z "$has_desc" ]; then
                echo "Description: $title" >> "$temp_file"
            fi
            
            # Skip the first line (title) from original file
            tail -n +2 "$md_file" | sed '/^Date:/d; /^Description:/d' >> "$temp_file"
            
            # Move fixed content back to original file
            mv "$temp_file" "$md_file"
            
            echo "Fixed formatting for $md_file"
        fi
    done
}

# Process markdown files
echo "Starting markdown to HTML conversion..."

# Make sure the md directory exists
mkdir -p md

# Fix markdown files formatting
fix_markdown_files

# Convert each markdown file to HTML using the template
for md_file in md/*.md; do
    if [ -f "$md_file" ]; then
        base_name=$(basename "$md_file" .md)
        html_file="${base_name}.html"
        
        echo "Converting $md_file to $html_file..."
        
        # Extract title and other metadata
        title=$(head -n 1 "$md_file" | sed 's/^# //')
        
        # Set active nav link based on filename
        active_about=""
        active_blog=""
        active_uses=""
        active_media=""
        
        if [ "$base_name" = "uses" ]; then
            active_uses="true"
        elif [ "$base_name" = "media" ]; then
            active_media="true"
        else
            active_blog="true"
        fi
        
        # Extract date and description with better handling
        date=$(grep -m 1 'Date:' "$md_file" | sed 's/Date: //' || echo '')
        description=$(grep -m 1 'Description:' "$md_file" | sed 's/Description: //' || echo '')
        
        # Create a temp file with metadata removed to avoid duplication
        temp_file=$(mktemp)
        sed '/^Date:/d; /^Description:/d' "$md_file" > "$temp_file"
        
        # Run pandoc with the template
        pandoc "$temp_file" \
            --template=template.html \
            --toc \
            --toc-depth=2 \
            --highlight-style=tango \
            --mathjax \
            --metadata title="$title" \
            --metadata active-about="$active_about" \
            --metadata active-blog="$active_blog" \
            --metadata active-uses="$active_uses" \
            --metadata active-media="$active_media" \
            --metadata date="$date" \
            --metadata description="$description" \
            --metadata math=true \
            -o "$html_file"
            
        # Remove temp file
        rm "$temp_file"
            
        echo "Converted $md_file to $html_file"
    fi
done

# Create the blog index
create_blog_index

# Clean up any HTML files that don't have corresponding MD files
echo "Cleaning up old HTML files..."
for html_file in *.html; do
    # Skip index.html, blog.html, and special pages
    if [[ "$html_file" == "index.html" || "$html_file" == "blog.html" || "$html_file" == "example.html" ]]; then
        continue
    fi
    
    base_name=$(basename "$html_file" .html)
    md_file="md/${base_name}.md"
    
    # If HTML file doesn't have corresponding MD file, remove it
    if [ ! -f "$md_file" ]; then
        echo "Removing $html_file as it has no corresponding markdown file"
        rm "$html_file"
    fi
done

echo "All markdown files have been converted to HTML!"
