# Github Actions and CI/CD Pipeline
## What is CI?
CI/CD stands for Continous Integration and Continuous Delivery. The first half, CI, refers to integrating changes to code/scripts frequently to a shared repository branch. 
Once changes are committed to a main branch, other developers can create other branches for individual work. Once they push their work forward, the automation aspect of the system will use scripts to not only build but test out the changes to the code made by indivdual developers.
Then the main branch can have all the code compiled in one place of the repository. Doing it in this way allows for faster bug fixes and updates from the teams working on the project.

## What is CD?
Continuous Delivery involves using the updated code changes from CI to a repository. Then team members would be able to deploy the work in an automated manner. The work would be deployed to users outside of the development team, such as customers, under the term "Continuous Deployment."

## Objective
You will learn how to utilize Github Actions so that work can be automated.


## Links
[What is CI/CD](https://www.redhat.com/en/topics/devops/what-is-ci-cd)

[Github Actions Quickstart](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions)

## Vocabulary

Workflow: process that automatically runs jobs or tasks. Written with YAML format.

Event: Any action that starts up a worflow. This includes committing changes, starting a pull request, etc.

Job: Steps within a workflow on the same server.

Action: performs a task automatically.

Events trigger workflows which activate actions.



## Commands



## Setting up Github Actions
1. Create a new repository in Github.
2.