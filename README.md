dotfiles
========


Installation
------------

 - Clone this repo somewhere (e.g. ~/Private/dotfiles).
 - Run `./deploy.sh` if you are on server machine or `./deploy.sh -a` if you want to install mutt, irssi and other
   "desktop" configurations as well.

Using .private
--------------

Some of the configuration script expect private information to be stored in include files in ~/.private directory.

### mutt

`~/.mutt/muttrc` includes `~/.private/special/muttrc` file, where you can store your credentials and mailboxes setup.
For GMail, generate app password here: [https://myaccount.google.com/apppasswords](https://myaccount.google.com/apppasswords)
and use following configuration example.

```muttrc
set from     = 'yourname@gmail.com'
set realname = 'Your name'
alternates     "your.name@gmail.com|your.name@aliasdomain.com"

set imap_user = "yourname@gmail.com"
set imap_pass = "--generated gmail password--"

set smtp_url  = 'smtp://yourname@gmail.com@smtp.gmail.com:587/'
set smtp_pass = '--generated gmail password--'

set folder    = "imaps://imap.gmail.com"
set spoolfile = "imaps://imap.gmail.com/INBOX"
set postponed = "imaps://imap.gmail.com/[Gmail]/Drafts"

set move = no
set imap_keepalive = 900

folder-hook . 'unset trash'
folder-hook imaps://imap.gmail.com 'set trash="=[Gmail]/Trash"'

mailboxes \
    "+Inbox" \
    "+[Gmail]/Drafts" \
    "+[Gmail]/Sent Mail" \
    "+[Gmail]/Spam" \
    "+[Gmail]/Trash"
```


### irssi

### bash
