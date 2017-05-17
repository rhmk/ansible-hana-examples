# ansible-hana-sysprep

## This is the Developer Branch 
### the current commit contained a couple of fundamental changes, so please switch to stable branch, if you have problems with these changes


This playbook can be used with Command Line (ansible-playbook), Ansible Tower and CloudForms 4.5 and later

This git repository will have several branches as follows:
- master:  current ongoing development
- stable:  fully tested releases incl. documentation

Follow the documentation on https://www.ansible.com to setup your ansible environment or ansible-tower server. 
Follow the instructions on https://access.redhat.com/documentation/en/red-hat-cloudforms/ for CloudForms

In order to use this playbook, you need a brand new RHEL6.x (x<=7) or RHEL 7.x (x<=2) installation.

You can download this ansible playbook by the following command:
<pre>
$ git clone https://github.com/rhmk/ansible-hana-sysprep.git
Initialized empty Git repository in /root/ansible-hana-sysprep/.git/
remote: Counting objects: 181, done.
remote: Compressing objects: 100% (15/15), done.
remote: Total 181 (delta 2), reused 0 (delta 0), pack-reused 163
Receiving objects: 100% (181/181), 146.76 KiB, done.
Resolving deltas: 100% (64/64), done.
</pre>



The following variables can/need to be set to configure the execution of the script. They can be set globally or locally.

```
# Debugging
#----------

You can set debuglevel for debugging with:
debuglevel: 3

Only active when running ansible-playbook with -vvv option. See man-page for details

#  System Registration. 
#-------------------------
# If you have a Satellite 6 Server or RedHat Network Account, define an activation key and you can automatically register the system to the appropriate channel

reg_activation_key: <activation_key>
reg_organization_id: <org_id>

# Set this variable to the DNS name of your satellite server, If unset the RHN is used for registration (Not implemented yet)
satellite_server:

#If you set force_repo_reset to true it removes all existing repos and readds the necessary correct EUS repositories
#If set to false it adds all necessary EUS repos to the existing 
force_repo_reset: [true|false]

# If you use a different setup of repositories and do not use Satellite or RHN set check_repos to false and make sure you have the right repositories configured to your system
check_repos: true

# Time
#----------

#Use this to configure your NTP-Server
ntpserver: ntp.pool.org

# Disk Setup
#------------
# This ansible script is able to configure your additional disks ready for use with hana by defining the follwoing variables
# This can be used to configure /hana/{data,log,shared}
# If you have setup your disks already, set disk_partioning to false
# Use with caution not to delete you setup

disk_partitioning: false
disks:
  <physdev1>: <volgroupname>
  <physdev2>: <volgroupname>
  ...

logvols:
  <name1>:
    size: <size in G>
    vol: <volgroupname>
    mountpoint: <path>
  <name2>:
    ...
    
# HANA Setup
#------------

# Gives the name of the customer of the Hana DB
customer: <string>

# NFS Server mountpoint where install media resides:
install_nfs: "10.32.97.3:/public/sap-software"

# directory, where Hana install binaries are needed
installroot: /install

# Hana Install version (RAR Archive Number)
installversion: "51051151"

# User and GroupIDs to use for sap (Default: undef)
id_user_sapadm: 
id_user_sidadm:
id_group_shm:
id_group_sapsys:

# Initial passwords in clear text
pw_sapadm:
pw_sidadm:
pw_systemuser:

# Optional: List of hosts in a scale out cluster
scaleouthosts

# Mandatory: SAP SystemID (3 Characters) and Instance Number (2 Numbers)
# For HANA Express always use HXE and 90(otherwise developer licence gets invalid)
sap_system_id: HXE
sap_instance: 90

# Optional: Hostname for Hana Installation
# required for multi-homed settings and cluster environments
sap_hostname:

# SAP system-usage
# Please use one of: production, test, development, custom
sap_hana_system_usage: custom

# HANA Components  to be installed
# possible options depend on HANA version
sap_hana_components: "clients,server"

# HANA System Type 
# defaults to Master in Scale-Up setups, but will be different in scale-out deployments
sap_hana_system_type: "Master"
```

Here is a short Howto on running this playbook from commandline

1. Configure your inventory with your servers (default: /etc/ansible/hosts), e.g.
```
   [...]

   [hana-servers]
   10.32.111.3 ansible_user=ansible-remote

   [...]
```
  ansible_user defines a specific username to use for the ssh connection 

2. Make sure your ansible connection to the target host is working:
```
$ ansible -m setup [-k connection_user password ] [-K root password]
10.32.111.3 | SUCCESS => {
"ansible_facts": {
     [...]
       }, 
    "changed": false
}

```
See "man ansible" for password options. You could also use ssh-keys and sudo without password

3. If your connection works you can kick-off the playbook
$ ansible-playbook -vvv  -b -e @examples/var.yaml hana_prep.yaml

  -vvv enables debugging output
  -b : switches execution to root
  -e @examples/var.yaml points to the file with the defined variables
  hana_prep.yaml: Playbook that defines the actual role

 
### TODO ###
- Check /etc/hosts for HANA compliance and correct
- act depending on HANA versions (different required libraries)


