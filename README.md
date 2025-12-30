# ```recarm```

### Usage
If you only want to install the default scripts shipped with recarm (i.e. you are the creator of recarm):
```bash
$ git clone https://github.com/mbyx/recarm.git
$ cd recarm
$ chmod +x recarm
$ ./recarm
```
Otherwise if you have your own curated set of scripts to install that are located in `/some/dir`:
```bash
$ git clone https://github.com/mbyx/recarm.git
$ cd recarm
$ chmod +x recarm
$ ./recarm /some/dir
```

To create your own scripts, follow the template:
```bash
#!/usr/bin/env bash

# Allow passing in the path of the recarm_lib and color_lib files.
SCRIPT_DIR="."
if [[ -n $1 ]]; then
    SCRIPT_DIR=$1
fi

cd "$SCRIPT_DIR" || exit
source "recarm_lib"
cd - || exit

register_install_step "Installer_Name" "echo \"Step #1\""
register_install_step "Installer_Name" "echo \"Step #2\""
# ...

# Runs only if this script is run directly.
# If it is sourced, we only want to register the steps.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    run_installer "Installer_Name"
fi
```
