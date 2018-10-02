---

#### Disk Configguration
disks:
        /dev/vdb: vg00
logvols:
        hana_shared:
                size: 32G
                vol: vg00
                mountpoint: /hana/shared
        hana_data:
                size: 32G
                vol: vg00
                mountpoint: /hana/data
        hana_logs:
                size: 16G
                vol: vg00
                mountpoint: /hana/logs
        usr_sap:
                size: 50G
                vol: vg00
                mountpoint: /usr/sap

#### HANA Configuration

hostname: "{{ ansible_hostname }}"
hana_sid: "HXE"
hana_instance: "90"

deployment_instance: true
#hsr_deploy_type: enable

instances:
  instance01:
    hdblcm_params: "--ignore=check_min_mem,check_platform"
    id_user_sidadm: "30210"
    pw_user_sidadm: "Adm12356"
    hana_pw_system_user_clear: "System123"
    hana_components: "client,server"
    hana_system_type: "Master"
    id_group_shm: "30220"
    hana_instance_hostname: "{{ ansible_hostname }}"
    hana_addhosts:
    hana_sid: "{{ hana_sid | upper }}"
    hana_instance_number: "{{ hana_instance }}"
    hana_system_usage: custom


