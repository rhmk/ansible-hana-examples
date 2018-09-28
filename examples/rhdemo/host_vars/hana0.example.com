---

hostname: "{{ ansible_hostname }}"
hana_sid: "HXE"
hana_instance: "90"

deployment_instance: true
#hsr_deploy_type: enable

instances:
  instance01:
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


