## Installing Vagrant with HashiCorp Repository on Ubuntu Linux OS

```bash
# Download the HashiCorp GPG key and save it as a file named hashicorp-archive-keyring.gpg in the /usr/share/keyrings directory.
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add HashiCorp's Debian repository to the list of package sources. The signed-by option specifies the keyring file for signature verification.
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update the list of available packages and install Vagrant from the HashiCorp repository.
sudo apt update && sudo apt install vagrant
