
# Sepcialties on Power

-> HMC Hardware Management Console verbindte sich zum FSP (Flexible Servcie Processor)
-> View of Servers
-> 

PreReq: - Knowledge PowerVM
        - HMC
	- Mount ISO Image

ISO auf VIO Server kopieren und als DVD Laufwerk anlegen
vioserver# mkvopt -name "Name" -file "Name.iso" -ro

# lsrep 
<zeigt die angelegten DVDs an >

Auf HMC unter Virtual Optuical Device  die o.a. DVD anlegen
=> Name für die Devcies vergeben z.b. vtopt und vioserver auswählen
=> Device Mapping auswählen => Load Media

=> LPAR Shutdown

=> Partition Actions => activate
	Select Boot Mode: System Management Services

Activate

==> Boot mit Installparameter
  ....
