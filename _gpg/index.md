---
title: how to work with GPG keys
---

A GPG key, also referred to as a **GnuPG** key (**GNU Privacy Guard**), is a digital key pair used for encryption and signing purposes. It consists of two parts:

1. **Public Key:** This is a mathematically related part of the key pair that can be freely shared with others. It's used for encrypting data or verifying digital signatures. Anyone with your public key can encrypt messages or files that only you, with the private key, can decrypt.

2. **Private Key:** This is the sensitive part of the key pair that should be kept secret and secure. It's used for decrypting messages or files encrypted with your public key and for signing data to create a digital signature.

Here's how GPG keys work in practice:

* **Encryption:** When someone wants to send you a secure message, they use your public key to encrypt the message. This encryption scrambles the message content, making it unreadable to anyone without the private key. Only you, with your private key, can decrypt the message and read its original content.

* **Signing:** When you sign a document or message with your private key, it creates a digital signature. This signature acts like a tamper-evident seal, proving that the data originated from you and hasn't been modified since it was signed. Anyone with your public key can verify the signature, ensuring the authenticity and integrity of the data.

**Benefits of GPG Keys:**

* **Confidentiality:** Encryption with GPG keys helps ensure only authorized recipients can access the information.
* **Data Integrity:** Signing with GPG keys verifies that the data hasn't been tampered with since it was signed.
* **Authentication:** Signing with GPG keys proves the authenticity of the source (i.e., the data came from you).
* **Non-repudiation:** Signing with GPG keys ensures you can't deny signing the data later.

**Common Uses of GPG Keys:**

* **Securing email communication:** Encrypting emails with the recipient's public key and signing emails with your private key.
* **Signing software releases:** Signing software releases with a GPG key ensures authenticity and prevents tampering.
* **Protecting sensitive documents:** Encrypting confidential documents for secure storage or transmission.
* **Verifying code commits:** Signing Git commits with a GPG key helps verify the author and prevent unauthorized changes.

In essence, GPG keys provide a powerful tool for securing your digital communications and data by ensuring confidentiality, integrity, and authenticity.


## work with GPGs

```bash
# generate one
gpg --full-generate-key # RSA is better than DSA!

# list keys
gpg --list-secret-keys

# export public key
gpg --armor --export <key-id> #  fingerprint or key ID
```

## config the key for git

```bash
git config --global user.signingkey <key-id> # got from gpg ``--list-secret-keys``
git config --global commit.gpgsign true
```
