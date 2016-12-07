# ansible-hana-sysprep

## For using this ansible playbook the following variables need to be set:

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


