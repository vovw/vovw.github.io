# SIH Experience: On-Device Encryption







We were tasked to "develop a functional solution that demonstrates the hardware-enabled root of trust." Basically, we needed to create a method to ensure that the authentication request for UIDAI app-based face authentication comes from a trusted source and ensure that the data doesn't get breached unlawfully by anyone. They were currently using a network call for encryption (wtf), so we had to implement on-device encryption for the same.

## Our Solution

For this, we built a cross-platform app that could do all that, and as an added bonus, we demonstrated the loopholes we found in their current infrastructure and what could be done to prevent attackers from getting unauthorized access. 

A few technical challenges we had to solve:
- Generate cryptographic keys that are unique to the user's smartphone
- Everything *had to be on device* - not a single network call
- Implement ECC (Elliptic Curve Cryptography) for asymmetric cryptography
- Use AES for secure symmetric encryption
- Ensure the solution was robust against various attack vectors

We built the entire infrastructure, cross-platform apps, system, testing, demo, penetration testing, and network testing - all in 5 days.

## Learning Process

During this project, I used Claude extensively for help with everything from:
- Setting up emulators on my MacBook
- Understanding how ECC works in detail
- Figuring out how to identify vulnerabilities in the current system
- Testing how fail-safe our proposed system was

## Key Takeaway

To summarize, I would recommend learning how to learn and how to effectively use large language models - they enable learning quickly and efficiently, cutting down on unnecessary steps to get to the finish line faster. I wouldn't have been able to learn and accomplish so much in such a short time without the help of Claude Sonnet 3.5 for teaching me concepts and QWQ 32B for helping with code implementation.


