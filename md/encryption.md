we were tasked to "develop a functional solution that demonstrates the hardware-enabled root of trust." basically, we needed to create a method to ensure that the authentication request for uidai app-based face authentication comes from a trusted source and ensure that the data doesn't get breached unlawfully by anyone. they were currently using a network call for encryption (wtf), so we had to implement on-device encryption for the same.

for this, we built a cross-platform app that could do all that, and as an added bonus, we demonstrated the loopholes we found in their current infrastructure and what could be done to prevent attackers from getting unauthorized access. a few quirks were that we had to generate keys that are unique to the user's smartphone. also, everything *had to be on device* - not a single network call. we used technologies like ecc for asymmetric cryptography, other goodies like aes, and our solution as a whole had so many quirks it was hilarious.

we built the entire infrastructure, cross-platform apps, system, testing, demo, penetration testing, network testing - all in 5 days.

during this project, i spammed claude for help with everything from learning how to set up emulators on my macbook, understanding how ecc works, to figuring out how to break into the current system and how fail-safe our proposed system was.

to summarize, i would recommend learning how to learn and how to use these large transformers - they enable learning quickly and fast, cutting down on the bs to get to the finish line faster. i would not be able to learn and do so much in such a short time, but i was able to thanks to claude sonnet 3.5 (new) for teaching me and qwq 32b for writing all the code

[home](../index.html)

