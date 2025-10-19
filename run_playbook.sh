#!/bin/bash
# Load environment variables from .env file
if [ -f .env ]; then
    # Load only non-comment lines from .env
    set -a
    source .env
    set +a
fi

# Run the playbook with the password from environment variable
ansible-playbook get_running_config.yml --extra-vars "cisco_password=$CISCO_PASSWORD"
