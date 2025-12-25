<<<<<<< HEAD
# Lab 12 Assignment: Terraform Modular Infrastructure

## Project Structure
This project uses a modular approach to deploy infrastructure.
- **modules/**: Contains reusable code for Networking, Security, and Webservers.
- **scripts/**: Shell scripts for instance initialization (Nginx/Apache).
- **Root**: Global configuration and variable definitions
# Assignment 2 - Multi-Tier Web Infrastructure

## Project Overview
This project deploys a highly available Nginx Load Balancer distributing traffic to multiple backend web servers with SSL/TLS termination, custom error handling, and automated health monitoring.

## Architecture

- **Nginx Load Balancer (10.0.10.96):** Handles SSL (443), rate limiting, and reverse proxying.
- **Backend Servers:** Two primary nodes (.209, .159) and one backup node (.107).

## Components Description
- **Terraform:** Infrastructure as Code (IaC) to provision VPC, Subnets, and EC2.
- **Nginx:** Acting as a Load Balancer and Web Server.
- **Health Check Script:** Bash script monitoring backend status every 30 seconds.

## Deployment & Configuration
1. Initialize: `terraform init`
2. Apply: `terraform apply -auto-approve`
3. **Nginx Config:** Update `/etc/nginx/nginx.conf` upstream block with backend IPs.

## Troubleshooting
- **502 Bad Gateway:** Ensure backend Nginx services are running.
- **Connection Refused:** Check Security Group Inbound Rules for Port 80/443.
- **Config Test Failed:** Run `sudo nginx -t` to find syntax errors..
=======
# Assignment2
>>>>>>> afcb15f59ebe4a8b55a11fba5f597273b18d17e0
