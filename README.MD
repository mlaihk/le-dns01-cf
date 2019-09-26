This project is designed to be a small docker to Create/Renew Let's Encrypt Certs by making use of the greate Dehydrated script by lukas2511 and Lexicon by AnalogJ. 
The image is based on Python:Slim to make it as small as possible.

It also borrowed from idea from csmith that the domains.txt will be monitor realtime for changes.

The docker will need a volume /letsencrypt for storing app data and certs.

It will also require the following environment variables for dehydrated and the normal environment variables for Lexicon:
EMAIL: <Your email passed to Let's Encrypt for notifications>
PROVIDER: <Designate provider for Lexicon>
LEXICON_<PROVIDER>USERNAME: <Username to use for Lexicon to connect to your DNS provider>
LEXICON<PROVIDER>TOKEN: <API Key from your DNS provider>
LEXICON<PROVIDER>_PASSWORD: <Account password for your DNS provider>
For example:
PROVIDER: cloudflare
LEXICON_CLOUDFLARE_USERNAME:you@email.com
LEXICON_CLOUDFLARE_TOKEN: asdf1231239182309af

Optional Environment Variable:
KEY_ALGO: {rsa|prime256v1|secp384r1}
This will tell dehydrated what algorithm to use for generating the private key. If not defined, will assume rsa for general cert issuance.


