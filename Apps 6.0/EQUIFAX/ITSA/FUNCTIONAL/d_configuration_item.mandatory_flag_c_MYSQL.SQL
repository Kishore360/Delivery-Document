SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_configuration_item.mandatory_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(
select count(1) as cnt from 
equifax_mdsdb.cmdb_ci_final SRC
left join equifax_mdwdb.d_configuration_item TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id AND SRC.cdctype<>'D' )
where 
CASE when (TRGT.class in ('Linux Server', 'Windows Server', 'Server', 'Solaris Server', 'AIX Server', 'ESX Server', 'Hyper V Server', 'IBM Mainframe LPAR', 'OS/X Server')
and TRGT.operating_system_c ='UNSPECIFIED' or TRGT.os_version_c ='UNSPECIFIED' or TRGT.os_service_pack_c ='UNSPECIFIED' or  ci_used_for_c_key ='UNSPECIFIED' or virtual_flag_c ='UNSPECIFIED' or TRGT.fqdn_c ='UNSPECIFIED' or TRGT.ci_data_classification_c_key ='UNSPECIFIED' ) then 'N'
when (TRGT.class in ('Platform','Platform CI') and  TRGT.ci_it_leader_c_key ='UNSPECIFIED' or TRGT.ci_enterpise_architect_c_key ='UNSPECIFIED' or TRGT.ci_platform_subtype_c_key ='UNSPECIFIED') then 'N'
when (TRGT.class in ('Application','Apache Web Server','IBM Websphere','Tomcat','Microsoft iis Web Server','Oracle Instance','MSFT SQL Instance','Business Service',
'Patch Group','DML','Platform','PostgreSQL Instance','JBoss','MySQL Instance','Weblogic','Database','DB2 Instance',
'JavaServer','Database Instance','Sybase Instance','GlassFish','HBase Instance','Service Group') 
and TRGT.country_c ='UNSPECIFIED' or TRGT.ci_customer_type_c_key ='UNSPECIFIED' or TRGT.ci_business_criticality_c_Key ='UNSPECIFIED' or TRGT.internet_facing_web_app_flag_c ='UNSPECIFIED' )then 'N'
when (TRGT.class in ('Linux Server','Computer','Windows Server','Server','IP Switch','Solaris Server','AIX Server','Windows Cluster','IP Router','Network Gear',
'Load Balancer','ESX Server','IP Firewall','Bluecoat','Storage Switch','Mainframe Hardware','IBM Mainframe LPAR','Modem Hardware','Wireless Access Point','OS/X Server',
'Storage Area Network','Virtual Private Network','Printer') and TRGT.mac_address_c ='UNSPECIFIED' ) then 'N'
ELSE 'Y' END <>TRGT.mandatory_flag_c and SRC.cdctype<>'D')temp;
