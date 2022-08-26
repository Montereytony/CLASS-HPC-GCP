gcloud iam service-accounts create tonycricelli@gmail.com --display-name="Tony Cricelli"

gcloud projects add-iam-policy-binding haas-jupyter-jub  \
    --member='serviceAccount:tonycricelli@haas-jupyter-jub.iam.gserviceaccount.com'  --role='roles/editor'
gcloud iam service-accounts keys create key.json --iam-account=tonycricelli@haas-jupyter-jub.iam.gserviceaccount.com



### Terraform-based RStudio setup

- `terraform init`
- `terraform apply`

This will create the VM and report the IP address to your terminal. Once the installation scripts are complete, you should be able to access a RStudio instance at `http://<IP ADDRESS>/`

Note that visting that address will prompt for a login. As set up, the RStuio instance uses the username/password of user accounts on the VM itself. If you wish to login to RStudio, it's probably best to create a "basic" user for yourself, as described below.

#### Creating users

The repository also comes with a helper script (`add_users.sh`). This allows us to add new system users (which effectively creates a login for RStudio) and to copy any common files that might need to be shared with all course participants. The script assumes the data is located in `/home/common_data`. If there is no common data to share, then the copy commands will just fail.

To run the script, you first have to SSH to the machine. Then, create a basic text file where each line has 3 elements delimited by a comma:
- email address
- a username (needs to be Unix valid!)
- a plain text password

Be careful not to put spaces in there, as it's a pretty brittle script. e.g. the file should look like:

```
foo@email.com,foo-user,abc123
bar@email.com,someone-else,def456
```

The `add_users.sh` takes this file as its first and only argument. It then iterates through each line, creating users, home directories, and copying any files.

The usernames and passwords in that file can then be used to log into RStudio. Each user will have their own workspace with copies of the necessary files.

