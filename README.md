![Logo](https://resources.mend.io/mend-sig/logo/mend-dark-logo-horizontal.png)

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)  
# Technical Services Workshop Setup Tools
This project aims to provide workshop facilitators with tools for setting up environments for workshop participants. TS-Workshop is designed for workshops with many participants so the workload can be distributed among several organizations.
In addition, projects used for workshops can easily be adjusted by the facilitator. Flows and detailed instructions for the workshop can be found [here](https://whitesource.atlassian.net/wiki/spaces/TES/pages/2500984892/Customer+Workshops).

# Workshop environments
The current workshop setup includes 3 GitHub, SCA, and SAST organizations.
- Workshops typically include GitHub and SCA organizations, while SAST organizations are optional depending on workshop requirements ([SAST focused workshops](#sast-focused-workshops)).
- Additional organizations can be added on demand ([Extending workshop setup](#extending-workshop-setup)).

| GitHub.com organization  | SCA organization | SAST organization |
| --- | --- | --- |
| [mendts-workshop](https://github.com/mendts-workshop) | MendTS-Workshop (https://saas.mend.io) | MendTS-Workshop (https://sast.mend.io/sast) |
| [mendts-workshop1](https://github.com/mendts-workshop1) | MendTS-Workshop1 (https://saas.mend.io) | MendTS-Workshop1 (https://sast.mend.io/sast) |
| [mendts-workshop2](https://github.com/mendts-workshop2) | MendTS-Workshop2 (https://saas.mend.io) | MendTS-Workshop2 (https://sast.mend.io/sast) |

# Tools for setting up a technical workshop
The following parameters are important for understating of the script’s functionality:
- **GH_USERS_PER_ORG** - Number of users participating in a (single) GH/SCA/SAST organization.
  - E.g., if GH_USERS_PER_ORG is set to 20 and there are 50 participants in the workshop, the first 20 will be created under MendTS-Workshop (GH/SCA/SAST organization). The next 20 participants will be created in MendTS-Workshop**1** (GH/SCA/SAST organization), and the last 10 in MendTS-Workshop**2** (GH/SCA/SAST organization).
  - It is recommended that organizations have up to 20 users (due to performance considerations).
- **GH_BRANCH** - The branch containing the project that will be used for the workshop (to be pushed to user repositories).
  - E.g., GH_BRANCH=easybuggy, means that the content of easybuggy branch will be pushed to user repositories.
  - [Modifying workshop content](#modifying-workshop-content).

High level overview of the scripts:
- #### GitHub scripts:
  - workshop-setup-github.sh
    - Create repositories in GitHub organizations based on GitHub users list (ghusers.txt). The repository is created with the same name as the GitHub user and give that user admin privileges.
    - Push the workshop project to the user repositories (from the specified branch).
  - workshop-cleanup-github.sh - Delete all repositories in GitHub organizations based on the GitHub users list (ghusers.txt).
- #### SCA scripts:
  - workshop-setup-sca.sh - Create administrator accounts for the email address list (emails.txt) in SCA organizations.
  - workshop-cleanup-sca.sh - Delete all accounts in SCA organizations based on the email address list (emails.txt).
- #### SAST scripts:
  - workshop-setup- sast.sh - Create administrator accounts for the email address list (emails.txt) in SAST organizations.
  - workshop-cleanup-sast.sh - Delete all accounts in SAST organizations based on the email address list (emails.txt).



# Appendix
#### SAST focused workshops
The SAST scripts are disabled by default and should be uncommented to set up SAST organizations for workshop participants.
- GitHub actions - Uncomment Workshop-setup-sast/ Workshop-cleanup-sast steps.
- Local execution – Uncomment SAST scripts.
#### Extending workshop setup
The following parameters will need to be updated to include the new organizations for extended [Workshop environments](#workshop-environments):
- GitHub parameters [GitHub scripts](#github-scripts):
  - GH_ORGS
- SCA parameters [SCA scripts](#sca-scripts):
  - WS_APIKEYS
  - WS_USERKEYS
- SAST parameters [SAST scripts](#sast-scripts):
  - SAST_API_TOKENS
#### Modifying workshop content
- **Adding new projects for the workshop** - Add a new branch to this repo with the desired content (e.g., the easybuggy branch includes the [easybuggy](https://github.com/k-tamura/easybuggy) application).
- **Updating existing projects** - Navigate to the corresponding branch and update the application content accordingly.

