# How to use the .env method for password protection

## Method 1: Using the script (Recommended)
```bash
./run_playbook.sh
```

## Method 2: Manual execution
```bash
# Load environment variables
source .env

# Run playbook
ansible-playbook get_running_config.yml --extra-vars "cisco_password=$CISCO_PASSWORD"
```

## Method 3: One-liner
```bash
source .env && ansible-playbook get_running_config.yml --extra-vars "cisco_password=$CISCO_PASSWORD"
```

## Security Benefits:
- Password is not in your inventory file
- `.env` file is in `.gitignore` so it won't be committed
- Password is passed as an extra variable at runtime
- Easy to change passwords without editing multiple files

## File Structure:
```
.env                    # Contains CISCO_PASSWORD=your_password (ignored by git)
.gitignore             # Contains .env to prevent committing sensitive data
hosts.ini              # Uses {{ cisco_password }} variable
run_playbook.sh        # Script that loads .env and runs playbook
```
