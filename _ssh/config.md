---
title: all about ssh config file (Host, Match, ...)
---

Check the man page with `man ssh_config` to see all the information at one place

[Ref on spacing](https://stackoverflow.com/questions/47281876/how-many-white-spaces-is-the-best-for-ssh-config)

[Ref on Match and Host](https://dev.to/nabbisen/openssh-configurations-by-hosts-h1g)

## debugging

Use `ssh -v` for better debugging

## how to set PreferredAuthentications

Keep `PreferredAuthentications` set to `publickey` in ssh config file and change it in command line instead:

```bash
ssh -o PreferredAuthentications=password username@server_ip
```

## prevent pubkey to be failed for new hosts

[Godd Resource](https://www.tecmint.com/fix-ssh-too-many-authentication-failures-error/)

### single case (Recommended)

Run your ssh command with `-o PubkeyAuthentication=no` like this:

```bash
ssh -o PubkeyAuthentication=no username@server_ip
```

### holistic methods

*WARNING*: this will prevent using public key for `github.com` for example

Add the following to your `~/.ssh/config` file:

```bash
Host *.*
    PubkeyAuthentication no
```

For a more neat solution, make the agent to be disabled:

```bash
Host *.*
    IdentityAgent none
```

## options

`IdentitiesOnly`
        Specifies that ssh(1) should only use the configured authentication identity and certificate files (either the default files, or those explicitly configured in the ssh_config files or passed on the ssh(1) command-line), even if ssh-agent(1) or a PKCS11Provider or SecurityKeyProvider offers more identities.  The argument to this keyword must be yes or no (the default).  This option is intended for situations where ssh-agent offers many different identities.

`IdentityAgent`
        Specifies the UNIX-domain socket used to communicate with the authentication agent.
        This option overrides the SSH_AUTH_SOCK environment variable and can be used to select a specific agent.  Setting the socket name to none disables the use of an authentication agent.  If the string "SSH_AUTH_SOCK" is specified, the location of the socket will be read
        from the SSH_AUTH_SOCK environment variable.  Otherwise if the specified value begins with a ‘$’ character, then it will be treated as an environment variable containing the location of the socket.

## PreferredAuthentications option

The `PreferredAuthentications` option in your SSH client configuration dictates the order in which the client attempts different authentication methods to connect to a server. Here's a breakdown of how each option works:

* **publickey:** This method uses a public key pair for authentication. You have a private key stored on your local machine, and the corresponding public key is installed on the server. During connection, the client sends a digitally signed message using your private key. The server verifies the signature with the public key, granting access if valid. This is considered the most secure option as it avoids transmitting passwords over the network.

* **keyboard-interactive:** This method prompts you for your username and password directly on the command line. While convenient, it's less secure than public key authentication because the password is transmitted in plain text, making it vulnerable to interception.

* **password:** This is the basic password authentication method. The client sends your username and password directly to the server for verification. It's the least secure option as brute-force attacks are more feasible.

* **gssapi-with-mic:** This method utilizes a security framework called GSSAPI (Generic Security Services Application Program Interface) for authentication. It relies on pre-established credentials on both the client and server for verification.  GSSAPI is less commonly used due to its complexity and potential compatibility issues.

* **hostbased:** This method relies on pre-configured host keys on both the client and server. The client verifies the server's host key against its trusted list. This method offers some security benefits but is discouraged because managing trusted host keys can be cumbersome and there are potential security risks associated with compromised keys.
