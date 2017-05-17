for i in `ls /root/caim/puppet/modules/hana/templates/*.erb`; do 
J2_NAME=$(echo $i | awk -F"/" {'print $NF'} | sed "s/erb/j2/g")
echo $J2_NAME
cat $i | sed "s/<%=/{{ /g" | sed "s/@//g" | sed "s/%>/ }}/g" > test/$J2_NAME


done

