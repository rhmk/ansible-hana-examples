#!/bin/bash
cd /root/caim/ansible/ansible-hana-sysprep/roles
find /etc/ansible/ ./hana-host ./hsr ./deployment ./preconfigure -type f  \
-exec sed -i s/hana_sid/hana_sid/g {}  \;  \
-exec sed -i s/hana_sid_small/hana_sid_small/g {}  \;  \
-exec sed -i s/hana_pw_system_user_clear/hana_pw_system_user_clear/g {}  \;  \
-exec sed -i s/hana_addhosts/hana_addhosts/g {}  \;  \
-exec sed -i s/hana_instance_hostname/hana_instance_hostname/g {}  \;  \
-exec sed -i s/hana_instance_number/hana_instance_number/g {}  \;  \
-exec sed -i s/hana_system_usage/hana_system_usage/g {}  \;  \
-exec sed -i s/id_user_sidadm/id_user_sidadm/g {}  \;  \
-exec sed -i s/hana_pw_hostagent_ssl/hana_pw_hostagent_ssl/g {}  \;  \
-exec sed -i s/hsr_name/hsr_name/g {}  \;  \
-exec sed -i s/id_group_sapsys/id_group_sapsys/g {}  \;  \
-exec sed -i s/pw_user_sapadm_clear/pw_user_sapadm_clear/g {}  \;  \
-exec sed -i s/hana_installdir/hana_installdir/g {}  \;  \
-exec sed -i s/pw_user_sidadm/pw_user_sidadm/g {}  \;  \
-exec sed -i s/hana_pw_system_user_clear/hana_pw_system_user_clear/g {}  \;  \
-exec sed -i s/pw_user_sidadm/pw_user_sidadm/g {}  \;  \
-exec sed -i s/hana_sid/hana_sid/g {}  \;  \
-exec sed -i s/hana_instance_number/hana_instance_number/g {}  \;  \
-exec sed -i s/hana_system_usage/hana_system_usage/g {}  \;  \
-exec sed -i s/hana_components/hana_components/g {}  \;  \
-exec sed -i s/hana_system_type/hana_system_type/g {}  \;  \
-exec sed -i s/hana_instance_hostname/hana_instance_hostname/g {}  \;  \
-exec sed -i s/hana_installdir/hana_installdir/g {}  \;  \
-exec sed -i s/pw_user_sapadm_clear/pw_user_sapadm_clear/g {}  \;  \
-exec sed -i s/hana_addhosts/hana_addhosts/g {}  \;  \
-exec sed -i s/hana_pw_system_user_clear/hana_pw_system_user_clear/g {}  \;  \
-exec sed -i s/hana_pw_system_user_clear/hana_pw_system_user_clear/g {}  \;
