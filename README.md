# Void-Packages Sources Management wrapper for XBPS-SRC.
![vpsm](https://github.com/sinetoami/vpsm/raw/master/doc/print.png)
**vpsm** was made specifically for [Void Linux][0]. Is a simple wrapper for [**xbps-src**][1] commands that allows handling binary packages sources, query, smooth the workflow of the creation of new packages - and a little more. Also used to substitute some commands from [**xtools**][2] collection utilities.

## Motivation
Strongly inspired by [vpm][3] (originally created by [Armin Jenewein][4]) and [vsv][5] wrappers to management *xbps-** and *sv* commands respectively. I felt encouraged to write some similar idea after learning about the creation of new packages to Void Linux. I noticed the workflow is very repetitive and it's also necessary to be inside the [void-packages][6] local repository to make things work. This bothered me a little... ~~because I'm lazy~~. So, with the purpose to make things work easily and from anywhere in the terminal, I started it.

## Dependencies
* Void Linux
* git
* void-packages repository [cloned]
* ripgrep
* xtools

## Instalation
### 0. Fork Void Linux’s void-packages repository
### 1. Clone the void-packages repository forked
On my enviroment I like keep it inside my `$HOME` path
```bash
$ git clone git@github.com:my-github-username/void-packages.git ~/.void-packages
```

### 2. export `XBPS_DISTDIR`
Export in your `.bashrc` or `.zshrc`, or any other _rc_ file what you want, the `XBPS_DISTDIR=/path/to/void-packages/`.
```bash
$ echo "export XBPS_DISTDIR=$HOME/.void-packages" >> ~/.zshrc
```

### 3. Clone this repository
```bash
$ git clone https://github.com/sinetoami/vpsm.git
```

### 4. Add the `vspm` executable to `PATH`
For example, exporting inside `.zshrc` file
```bash
export PATH=$PATH:/path/to/vpsm/directory
```
I like to create a hidden  `.bin` directory on my `$HOME` path and add it to `$PATH` var, move/copy/link the `vpsm` executable. But you can do it any way you like.
```bash
$ mkdir ~/.bin
$ git clone https://github.com/sinetoami/vpsm.git ~/vpsm
$ cd vpsm
$ ln -s ~/vpsm/vpsm ~/.bin/
$ echo "export PATH=$PATH:$HOME/.bin" >> ~/.zshrc
```

## Installation using Makefile
Before installing using this method, you need to know two things:
* The default `PREFIX` path is set to `/usr/local` - you can change it.
* If you changes the `PREFIX`, make sure it's in the `PATH`.
```bash
$ sudo make install

or

$ sudo make install PREFIX=/new/path
```

## Usage
```
USAGE:

  vpsm [OPTIONS] [SUBCOMMANDS] [<ARGS>]

OPTIONS:

  --color=<yes|no|auto>        - Enable/Disable colorized output (default: auto)
  --help                       - (same as: help)
  --help-pager                 - (same as: helppager)


GIT SUBCOMMANDS:

  add-changes (ac) <file>                       - Add work changes in your clone repository.
  add-remote-repo (arr) <remote-name> <url>     - Add new remote repo in your clone repository.
  checkout-branch (co) <branch-name>            - Switch branch.
  commit-changes (cc) <message>                 - Commits changes added.
  create-branch (cb) <branch-name>              - Create a new branch.
  delete-branch (delb) <branch-name>            - Delete a existing branch.
  pull (pp) <remote-repo> <branch>              - Pull commit from <remote-repo> <remote-branch>.
  pull-request (pr) [message]                   - Create a pull-request [optional message].
  push-commit (pc) <remote-repo> <branch>       - Push commits to <romote-repo> <remote-branch>.
  update-repo (upr)                             - Pull commits from void-linux official repo.


XBPS-SRC SUBCOMMANDS:

  binbootstrap (bb)                             - Install bootstrap packages from host repositories into <masterdir>.
  bootstrap-up (bu)                             - Updates bootstrap packages.
  build-environment                             - Configure environment to create binary packages.
  edit-template (et) <pkgname>                  - Edit <pkgname> template.
  install (i) <pkgname>                         - Build binary package for <pkgname> and all required dependencies and install.
  lint (li) <pkgname>                           - Scan XBPS <pkgname> template for common mistakes.
  list (l)                                      - Lists installed packages in <masterdir>.
  pkg <pkgname>                                 - Only build binary package for <pkgname> and all required dependencies.
  purge-distfiles (pdistf)                      - Removes all obsolete distfiles in <hostdir>/sources.
  searchbin (sb) <pkgname>                      - Search in <hostdir>/binpkgs for package by <name> (use xbps-query).
  searchsrc (ss) <pkgname>                      - Search in <srcpkgs> for package by <name>.
  show (sw) <pkgname>                           - Show information for the specified package.
  show-build-deps (bdeps) <pkgname>             - Show required build dependencies for <pkgname>.
  show-deps (rdeps) <pkgname>                   - Show required run-time dependencies for <pkgname>.
  uninstall (un) <pkgname>                      - Uninstall and purge distfiles for <pkgname>.
  update-bulk (upb)                             - Rebuilds all packages in the system repositories that are outdated.
  update-check (upc) <pkgname>                  - Check upstream site of <pkgname> for new releases.
  update-sys (ups)                              - Rebuilds packages in system and updates them.
  xgsum <pkgname>                               - Generate SHA256 for <pkgname> template.
  xinstall (xi) <pkgname>                       - Like xbps-install -S <pkgname>, but take cwd repo and sudo/su into account.
```

## Examples
#### Query some package from `srcpkgs` directory
```bash
$ vpsm searchsrc chrome
[vpsm] Searching (srcpkgs) -> chrome (search_result chrome):
[-] chrome-gnome-shell    - GNOME Shell integration for Chrome
[*] google-chrome         - An attempt at creating a safer, faster, and more stable browser
[-] mkchromecast          - Cast Linux Audio/Video to Google cast and Sonos devices
[-] python3-chromecast    - Python3 library to communicate with Google Chromecast
[-] xf86-video-openchrome - Xorg driver for VIA IGPs
[vpsm] [search_result chrome], return code was: 0
```

#### Update upstream repository
```bash
$ vpsm update-repo
[vpsm] Pull commits from void-linux official repo->void-linux
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
...
From https://github.com/void-linux/void-packages
 * branch                  master     -> FETCH_HEAD
   485822d38b..d3df1d1680  master     -> void-linux/master
Updating 485822d38b..d3df1d1680
Fast-forward
 README.md                                              |  2 +-
 srcpkgs/GCP-Guest-Environment/template                 | 10 +++-------
 srcpkgs/NetworkManager/template                        |  4 ++--
 srcpkgs/aisleriot/template                             |  4 ++--
 srcpkgs/ampache/template                               |  4 ++--
...
 srcpkgs/xsoldier/template                              | 16 ----------------
 27 files changed, 113 insertions(+), 94 deletions(-)
...
Current branch master is up to date.
...
=> xbps-src: updating /home/sineto/.void-packages/masterdir ...
[*] Updating `https://alpha.de.repo.voidlinux.org/current/x86_64-repodata' ...
...
`https://alpha.de.repo.voidlinux.org/current/aarch64/x86_64-repodata': Not Found
```

#### Show required build dependencies
```bash
$ vpsm show-build-deps vivaldi
[vpsm] Show required build dependencies -> vivaldi (./xbps-src show-build-deps vivaldi):
desktop-file-utils
hicolor-icon-theme
[vpsm] [./xbps-src show-build-deps vivaldi], return code was: 0
```

## References
* Xbps-src - Void Linux Wiki - https://wiki.voidlinux.eu/Xbps-src
* Void Packages Manual - https://github.com/sinetoami/void-packages/blob/master/Manual.md
* VoidLinux's quick PR guide - https://forum.voidlinux.org/t/voidlinuxs-quick-pr-guide/6333

## Special thanks
* [Dave Eddy](https://github.com/bahamas10) - From whom I copied a piece of code from his [vpm][3] 
fork and the Makefile file.
* [shizonic](https://github.com/shizonic) - For encouraging me to continue with this small project.

Thank you guys! Cheers!

## Self-Promotion
Do you like this plugin? Come on:
- Star and follow the repository on [GitHub](https://github.com/sinetoami/vpsm).
- Follow me on
  - [GitHub](https://github.com/sinetoami)

## License
[MIT License](https://raw.githubusercontent.com/sinetoami/vpsm/master/LICENSE)


[0]: https://voidlinux.org
[1]: https://github.com/void-linux/void-packages/blob/master/xbps-src
[2]: https://github.com/chneukirchen/xtools
[3]: https://github.com/bahamas10/vpm
[4]: https://github.com/netzverweigerer/vpm
[5]: https://github.com/bahamas10/vsv
[6]: https://github.com/void-linux/void-packages
