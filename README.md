# 🏗️ Infrastructure

[![Terraform Cloud](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://app.terraform.io/app/connormaglynn/workspaces/)

This repository manages the infrastructure I use for personal projects 🙋 👀

Each provider uses a separate CI/CD pipeline to easily track individual deployments 🚀 ♻️

Below is a table of the infrastructure 👇 🏓

| 🏷️ Name   | 👀 Location                             | 🚀 Deployment                                                                                                                  |
| :------- | :------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------- |
| ⛅️ AWS    | [terraform/aws](./terraform/aws)       | [Terraform - AWS](https://github.com/connormaglynn/infrastructure/actions/workflows/terraform-aws.yml?query=branch%3Amain)    |
| 👾 GitHub | [terraform/github](./terraform/github) | [Terraform - GitHub](https://github.com/connormaglynn/infrastructure/actions/workflows/terraform-github.yml?query=branch%3Amain) |
| 🔥 GCP    | N/A                                    | N/A                                                                                                                           |
| 🔐 Auth0  | N/A                                    | N/A                                                                                                                           |
