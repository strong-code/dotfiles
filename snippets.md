# Helpful Snippets

Helpful commands or snippets that would be nice to copy/paste

## IRC

List tmux sessions:

    $ tls

Attach to existing named tmux irc session locally:

    $ tmux a -d -t irc  

Create new tmux irc session locally:

    $ tmux new -s irc 'irssi'

Scrolling in Terminal.app with irssi in tmux `Option+P`/`Option+N` or `fn+shift+up`/`fn+shift+down` 
 
## DNS

For DoH, currently using `default` [AdGuard servers](https://adguard.com/en/adguard-dns/overview.html#instruction )

## Mouse

DPI is set to 1200 (G900) or 1500 (G604) in G Hub/Onboard Memory Manager

## GPG Signing Keys

On a new computer, [generate a key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key). 

Add it to GitHub, then add key ID to ~/.gitconfig 
