#!/bin/bash
cd /root/caim/ansible/ansible-hana-sysprep/roles
find /etc/ansible/ ./hana-host ./hsr ./deployment ./preconfigure -type f  \
-exec sed -i s/sapsystemname/hana_sid/g {}  \;  \
-exec sed -i s/sapsystemname_small/hana_sid_small/g {}  \;  \
-exec sed -i s/system_user_password/hana_pw_system_user_clear/g {}  \;  \
-exec sed -i s/sap_addhosts/hana_addhosts/g {}  \;  \
-exec sed -i s/sap_hostname_instance/hana_instance_hostname/g {}  \;  \
-exec sed -i s/sapsystemnummer/hana_instance_number/g {}  \;  \
-exec sed -i s/sapsystem_usage/hana_system_usage/g {}  \;  \
-exec sed -i s/sidadm_userid/id_user_sidadm/g {}  \;  \
-exec sed -i s/sap_hostagent_sslpassword/hana_pw_hostagent_ssl/g {}  \;  \
-exec sed -i s/customer/hsr_name/g {}  \;  \
-exec sed -i s/sapsys_groupid/id_group_sapsys/g {}  \;  \
-exec sed -i s/sapadm_passwd_clear/pw_user_sapadm_clear/g {}  \;  \
-exec sed -i s/sapinstalldir/hana_installdir/g {}  \;  \
-exec sed -i s/sidadm_passwd_clear/pw_user_sidadm/g {}  \;  \
-exec sed -i s/system_user_passwd_clear/hana_pw_system_user_clear/g {}  \;  \
-exec sed -i s/pw_sidadm/pw_user_sidadm/g {}  \;  \
-exec sed -i s/sap_system_id/hana_sid/g {}  \;  \
-exec sed -i s/sap_instance/hana_instance_number/g {}  \;  \
-exec sed -i s/sap_hana_system_usage/hana_system_usage/g {}  \;  \
-exec sed -i s/sap_hana_components/hana_components/g {}  \;  \
-exec sed -i s/sap_hana_system_type/hana_system_type/g {}  \;  \
-exec sed -i s/sap_hostname/hana_instance_hostname/g {}  \;  \
-exec sed -i s/installroot/hana_installdir/g {}  \;  \
-exec sed -i s/pw_sapadm/pw_user_sapadm_clear/g {}  \;  \
-exec sed -i s/scaleouthosts/hana_addhosts/g {}  \;  \
-exec sed -i s/hana_hana_pw_system_user_clear_clear/hana_pw_system_user_clear/g {}  \;
