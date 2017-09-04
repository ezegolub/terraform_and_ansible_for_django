# Terraform and Ansible for django projects

This is the accompanying repo for the talk. We have 3 folders:

- `terraform`: Terraform recipes for spinning up a simple ec2 instance for a django project, an rds database and a s3 bucket for storing releases. 
- `ansible`: For installing a simple django stack: Nginx + uwsgi, plus setting it up in a way we can differentiate between enviroments as in: alpha, beta, qa, production
- `django`: Boilerplate hello world django project, with a simple migration to test we're actually hitting a database.


