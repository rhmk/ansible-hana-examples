# ansible-hana-sysprep

In order to use this playbook, you need a brand new RHEL6.x installation.

1. You can download this ansible playbook by the following command:
<pre>
$ git clone https://github.com/rhmk/ansible-hana-sysprep.git
Initialized empty Git repository in /root/ansible-hana-sysprep/.git/
remote: Counting objects: 181, done.
remote: Compressing objects: 100% (15/15), done.
remote: Total 181 (delta 2), reused 0 (delta 0), pack-reused 163
Receiving objects: 100% (181/181), 146.76 KiB, done.
Resolving deltas: 100% (64/64), done.
</pre>

2. The following variables need to be set:

```
reg_activation_key:
reg_organization_id:

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
    
```

3. Create an inventary with the HANA hosts you would like to install:

<pre>
# Example of /etc/ansible/hosts
$ tail -3 /etc/ansible/hosts 
[hana]
192.168.42.236
192.168.42.235
</pre>

4. Finally, run the following command and the server will be ready to install SAP HANA:
<pre>
$ ansible-playbook ansible-sap-hana/playbook.yml
</pre>
