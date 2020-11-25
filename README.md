# CentOS 5 Vagrant environment with Ansible provisioning

This environment sets up a Python 2 Virtualenv with a suitable Ansible
version to manage a CentOS 5 host.

The default Python version in CentOS 5 is Python 2.4, but Ansible 2.4
and higher requires at least Python 2.6 in the managed host. More
details in,

https://www.ansible.com/blog/using-ansible-to-manage-rhel-5-yesterday-today-and-tomorrow

## Requirements

- vagrant
- virtualbox
- make
- python2 (With module build support)
- virtualenv

## How to use

Only two Vagrant actions need to be managed, `up` and `provision`.

Instead of `vagrant up`,

```
$ make up
```

And instead of `vagrant provision`,

```
$ make provision
```

The Vagrant environment is set up to provision the machine using the playbook,

```
ansible/playbook.yml
```

There is an initial role, `base-packages`, 

```
ansible/roles/base-packages
```

It will install the list of packages provided in the variable `base_packages`,

```
vars:
  base_packages:
  - vim-enhanced
  - rsync
  - screen
```

The target `clean`,

```
$ make clean
```

Removes the virtualenv in `ansible/venv`.
