# The Groovy Machine Playbook

This is my Arch Linux setup automation playbook. Before running the playbook, consider that:

- The target machine's OS is Arch Linux.
- The target machine has python installed.
- The target machine already has a user that is part of the `wheel` group.
  This user will be used when yay is used to install packages from AUR.

Before running the playbook, run the following commands in that folder

1. Run `ansible-galaxy install -r requirements.yml` to install the dependencies.
2. Run `make build` and `make test` to test the playbook with `molecule` and make sure it works.

If you're ready to run the playbook on your machine:

1. Change the `playbook.yml`:
    - `hosts` value to `localhost` (or the machine you are targetting).
    - `unprivileged_user` value to the user that is in the `wheel` group and
      will be running `yay`
      (user must be able to sudo and use pacman without being asked for
      a password).
2. Run `./remove_post_install_problematic_packages.sh` to remove problematic packages
3. Run the playbook with `ansible-playbook --become playbook.yml --connection local -i localhost --extra-vars="unprivileged_user=$(whoami)"`
4. Run `./post_playbook_install.sh` to install the packages that can't be installed with the playbook
5. Enjoy !
