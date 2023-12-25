# Puppet Configuration Management Project

## Resources

### Read or Watch
- **Intro to Configuration Management**: Get an overview of configuration management concepts.
- **Puppet Resource Type: File**: Refer to the [Resource types](https://puppet.com/docs/puppet/latest/lang_resources.html) documentation for all manifest types.
- **Puppet’s Declarative Language: Modeling Instead of Scripting**: Understand the declarative language used in Puppet for modeling infrastructure.
- **Puppet lint**: Learn about Puppet lint for validating and improving your Puppet code.
- **Puppet Emacs Mode**: Explore the Puppet mode for Emacs users.

## Requirements

### General
- All files interpreted on Ubuntu 20.04 LTS.
- Files should end with a new line.
- A mandatory `README.md` file at the project's root.
- Puppet manifests must pass `puppet-lint` version 2.1.1 without any errors.
- Puppet manifests must run without errors.
- The first line of Puppet manifests must be a comment explaining the manifest's purpose.
- Puppet manifest files must end with the extension `.pp`.

### Note on Versioning
Your Ubuntu 20.04 VM should have Puppet 5.5 preinstalled.

### Install Puppet
```bash
$ apt-get install -y ruby=1:2.7+1 --allow-downgrades
$ apt-get install -y ruby-augeas
$ apt-get install -y ruby-shadow
$ apt-get install -y puppet
```
Note: No need to attempt version upgrades; this project focuses on basic syntax.

### Puppet 5 Docs
Refer to the [Puppet 5 documentation](https://puppet.com/docs/puppet/5.5/index.html).

### Install puppet-lint
```bash
$ gem install puppet-lint
```

## Tasks

### 0. Create a File

Using Puppet, create a file in `/tmp`.

#### Requirements:
- File path: `/tmp/school`
- File permission: `0744`
- File owner: `www-data`
- File group: `www-data`
- File content: "I love Puppet"

#### Example:
```bash
$ puppet-lint --version
puppet-lint 2.5.2

$ puppet-lint 0-create_a_file.pp

$ puppet apply 0-create_a_file.pp

$ ls -l /tmp/school
-rwxr--r-- 1 www-data www-data 13 Mar 19 23:12 /tmp/school

$ cat /tmp/school
I love Puppet
```

### 1. Install a Package

Using Puppet, install Flask from `pip3`.

#### Requirements:
- Install Flask
- Version: 2.1.0

#### Example:
```bash
$ puppet apply 1-install_a_package.pp

$ flask --version
Python 3.8.10
Flask 2.1.0
Werkzeug 2.1.1
```

### 2. Execute a Command

Using Puppet, create a manifest that kills a process named `killmenow`.

#### Requirements:
- Use the `exec` Puppet resource
- Use `pkill`

#### Example:
```bash
# Terminal #0 - Starting my process
$ cat killmenow
#!/bin/bash
while [[ true ]]; do
    sleep 2
done

$ ./killmenow

# Terminal #1 - Executing my manifest
$ puppet apply 2-execute_a_command.pp

# Terminal #0 - Process has been terminated
$ ./killmenow
Terminated
```
