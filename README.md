### USAGE
vpsm `[subcommand]` `[<arg>]`

Eg.: vpsm xgsum my-new-package

### SUBCOMMANDS
* **add-commit-changes** (acc) `<commit-message>`   
    Add and commit work changes on void-packages clone repository.

* **binbootstrap** (bb)                             
    Install bootstrap packages from host repositories into `<masterdir>`.

* **bootstrap-up** (bu)                             
    Updates bootstrap packages.

* **build-environment**                             
    Configure environment to create binary packages.

* **build-deps** (swbd) `<pkgname>`                 
    Show required build dependencies for `<pkgname>`.

* **edit-template** (et) `<pkgname>`                
    Edit `<pkgname>` template.

* **install** (i) `<pkgname>`                       
    Build binary package for `<pkgname>` and all required dependencies and install.

* **list** (l)                                      
    Lists installed packages in `<masterdir>`.

* **pkg** `<pkgname>`                               
    Only build binary package for <pkgname> and all required dependencies.

* **pull**                                          
    Update void-packages and sources repositories.

* **purge-distfiles** (pdistf)                      
    Removes all obsolete distfiles in `<hostdir>/sources`.

* **push-commit** (pc)                              
    Push commits to void-packages clone repository.

* **search** (s) `<pkgname>`                        
    Search for package by `<name>`.

* **show** (sw) `<pkgname>`                         
    Show information for the specified package.

* **uninstall** (un) `<pkgname>`                    
    Uninstall and purge distfiles for `<pkgname>`.

* **update-repo** (upr)                             
    Pull commit from remote branch master and push commit changes to void-packages clone repository.

* **update-sys** (ups)                              
    Rebuilds packages in system and updates them.

* **xgsum** `<pkgname>`                             
    Generate SHA256 for `<pkgname>` template.
