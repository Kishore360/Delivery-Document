select c.serial_number_c,c.class,c.name,c.ip_address_c from equifax_mdwdb.d_configuration_item as a
join equifax_mdwdb.d_configuration_item as c on 
 a.serial_number_c=c.serial_number_c 
 where c.class IN ('Application', 'Apache Web Server', 'IBM Websphere', 'Solaris Server', 'AIX Server',
 'ESX Server', 'Hyper V Server', 'IBM Mainframe LPAR', 'OS/X Server') group by 1 having count(1)>1 