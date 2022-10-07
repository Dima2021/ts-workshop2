![Logo](https://resources.mend.io/mend-sig/logo/mend-dark-logo-horizontal.png)

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)  
# Technical Services Workshop Setup Tools
Tools for setting up a technical services workshop
- The github setup script will create a repository in the https://github.com/wsts-workshop organization according to the ghusers.txt list with the same name as the github user and give that user admin priviledges.
- The SAST setup script will add the email as an administrator to the ts-workshop-organization in https://sast-demo.whitesourcesoftware.com
  - This script is currently broken due to bugs with user access control
- The cleanup script will delete all repositories in the https://github.com/wsts-workshop organization according to the ghusers.txt list

## Supported Operating Systems
- **Linux (Bash):**	CentOS, Debian, Ubuntu, RedHat

## Prerequisites
- Fill ghusers.txt with github user accounts that will be participating in the workshop.  Do not use commas, just line seperated
- Fill emails.txt with email accounts that will be participating in the workshop.  Do not use commas, just line seperated

## Installation
- ```git clone``` this repository and ```cd``` into the directory


## Execution
Execution instructions:  
- Run to populate repos ```./workshop-setup-Github.sh ghusers.txt```
  - Run ```wc -l repocreated.txt``` to verify creation #
