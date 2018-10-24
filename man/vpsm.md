VPSM 1 "OCTUBER 2018" Linux "User Manuals"
=======================================

NAME
----

vpsm - void-packages sources management wrapper for xbps-src.

SYNOPSIS
--------

**vpsm** [*OPTIONS*] [*SUBCOMMANDS*] [*<ARGS>*]

DESCRIPTION
-----------

**vpsm** was made specifically for Void Linux. Is a simple wrapper for **xbps-src** commands that allows handling binary packages sources, query, smooth the workflow of the creation of new packages - and a little more. Also used to substitute some commands from **xtools**(1) collection utilities.

OPTIONS
-------

**--color=***<yes|no|auto>*
  Enable/Disable colorized output (default: auto)

**--help**
  (same as: help).

**--help-pager**
  (same as: helppager).


GIT SUBCOMMANDS
-------

**add-changes, ac** *[file]*
  Add worked changes to the cloned repository - more details 
  **git-add**(1).

**add-remote-repo, arr** *<remote-name> <url>*
  Add new remote repository to the cloned repository.

**checkout-branch, co** *<branch>*
  Switch branch.

**commit-changes, cc**
  Commits changes added - the message will be something like "New 
  package: my-package-name-0.1_1".

**create-branch, cb** *<branch>*
  Create a new branch.

**delete-branch, delb** *<branch>*
  Delete a existing branch.

**pull, pp** *<remote> <branch>*
  Pull commit from `<remote> <branch>`.

**pull-request, pr** *[message]*
  Create a pull-request - [optional message].

**push-commit, pc** *<remote> <branch>*
  Push commits to `<remote> <branch>`.

**update-repo, upr**
  Pull commits from Void Linux's void-packages repository.

XBPS-SRC SUBCOMMANDS
-------

**binbootstrap, bb**
  Install bootstrap packages from host repositories into `<masterdir>`.

**bootstrap-up, bu**
  Updates bootstrap packages.

**build-environment**
  Configure environment to create binary packages.

**edit-template, et** *<pkgname>*
  Edit `<pkgname>` template.

**install, i** *<pkgname>*
  Build binary package for `<pkgname>`, all required dependencies and 
  install.

**lint, li** *<pkgname>*
  Scan XBPS `<pkgname>` template for common mistakes.

**list, l**
  Lists installed packages in `<masterdir>`.

**pkg** *<pkgname>*
  Only build binary package for `<pkgname>` and all required 
  dependencies.

**purge-distfiles, pdistf**
  Removes all obsolete distfiles in `<hostdir>/sources`.

**searchbin, sb** *<pkgname>*
  Search in `<hostdir>/binpkgs` for package by `<name>` - use xbps-query.

**searchsrc, ss** *<pkgname>*
  Search in `<srcpkgs>` for package by `<name>`.

**show, sw** *<pkgname>*
  Show information for the specified package.

**show-build-deps, bdeps** *<pkgname>*
  Show required build dependencies for `<pkgname>`.

**show-deps, rdeps** *<pkgname>*
  Show required run-time dependencies for `<pkgname>`.

**uninstall, un** *<pkgname>*
  Uninstall and purge distfiles for `<pkgname>`.

**update-bulk, upb**
  Rebuilds all packages in the system repositories that are outdated.

**update-check, upc** *<pkgname>*
  Check upstream site of `<pkgname>` for new releases.

**update-sys, ups**
  Rebuilds packages in system and updates them.

**xgsum** *<pkgname>*
  Generate SHA256 for `<pkgname>` template.

**xinstall, xi** *<pkgname>*
  Like xbps-install -S `<pkgname>`, but take cwd repo and sudo/su into 
  account.

ENVIRONMENT
-----

**XBPS_DISTDIR**
  The void-packages repository directory path passed to the **vpsm** 
  command.

BUGS
----

All bugs should be reported to https://github.com/sinetoami/vpsm

AUTHOR
------

`Sinésio Neto <sinetoami> <sinetoami@gmail.com>`

SEE ALSO
--------

**xtools**(1), **git-add**(1)

SEE ALSO
--------
MIT License
