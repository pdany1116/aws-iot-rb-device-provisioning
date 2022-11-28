# Tool for AWS IoT Fleet Provisioning 
This repository represents a development tool for AWS IoT Fleet Provisioning by Trusted User.

The application creates an AWS Claim Provisioning Certificate. The certificate along with some
configurations are sent via HTTP request to the device's API.

## Setup
1. Create `.env` file: `cp .env.example .env` and set accordingly.
2. `docker-compose build`
3. `docker-compose run app`
