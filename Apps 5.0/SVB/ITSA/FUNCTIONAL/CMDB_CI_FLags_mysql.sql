SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN svb_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where dns_domain<>dns_domain_c or
ip_address<>ip_address_c or
fqdn<>fqdn_c or
mac_address<>mac_address_c or
serial_number<>serial_number_c or
short_description<>short_description_c or
u_environment<>environment_c or
case when u_glba=0 then 'N' else 'Y'END <>glba_c_flag or
case when u_pci=0 then 'N' else 'Y'END <>pci_c_flag or
case when u_pii=0 then'N' else 'Y'END<>pii_c_flag or
case when u_sox=0 then'N' else 'Y'END <>sox_c_flag