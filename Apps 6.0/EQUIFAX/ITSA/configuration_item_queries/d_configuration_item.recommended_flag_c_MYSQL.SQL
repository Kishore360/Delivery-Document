SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_onfiguration_item.recommended_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(
select count(1) as cnt from 
equifax_mdsdb.cmdb_ci_final SRC
left  join equifax_mdwdb.d_configuration_item TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id AND SRC.cdctype<>'D') and SRC.cdctype<>'D'
 where 
CASE when (TRGT.class in ('Linux Server', 'Windows Server', 'Server', 'Solaris Server', 'AIX Server', 'ESX Server', 'Hyper V Server', 'IBM Mainframe LPAR', 'OS/X Server')
and TRGT.dns_domain_c='UNSPECIFIED' or TRGT.ci_location_logical_c_key ='UNSPECIFIED' ) then 'N'
when TRGT.class ='Platform' and  (TRGT.ci_it_leader_c_key='UNSPECIFIED' or TRGT.ci_enterpise_architect_c_key ='UNSPECIFIED' or TRGT.ci_platform_subtype_c_key ='UNSPECIFIED') THEN 'N'
when TRGT.class in ('Application','Apache Web Server','IBM Websphere','Tomcat','Microsoft iis Web Server','Oracle Instance','MSFT SQL Instance','Business Service',
'Patch Group','DML','Platform','PostgreSQL Instance','JBoss','MySQL Instance','Weblogic','Database','DB2 Instance',
'JavaServer','Database Instance','Sybase Instance','GlassFish','HBase Instance','Service Group') 
and( TRGT.primary_data_center_c ='UNSPECIFIED' or TRGT.secondary_data_center_c ='UNSPECIFIED' or TRGT.ci_application_architect_c_key ='UNSPECIFIED'  or TRGT.ci_application_type_c_key ='UNSPECIFIED' or TRGT.ci_application_subtype_c_key ='UNSPECIFIED' )then 'N'
when TRGT.class ='DML' and TRGT.vendor ='UNSPECIFIED' then 'N'
when TRGT.class in ('Linux Server','Computer','Windows Server','Server','IP Switch','Solaris Server','AIX Server','Windows Cluster','IP Router','Network Gear',
'Load Balancer','ESX Server','IP Firewall','Bluecoat','Storage Switch','Mainframe Hardware','IBM Mainframe LPAR','Modem Hardware','Wireless Access Point','OS/X Server',
'Storage Area Network','Virtual Private Network','Printer') and (TRGT.device_type_c ='UNSPECIFIED' OR TRGT.ci_model_id_c_key ='UNSPECIFIED' )then 'N'
WHEN TRGT.class in ('Application', 'Apache Web Server', 'IBM Websphere', 'Tomcat', 'Microsoft iis Web Server', 'Oracle Instance', 'MSFT SQL Instance', 
'Business Service', 'Patch Group', 'DML', 'Platform', 'PostgreSQL Instance', 'JBoss', 'MySQL Instance', 'Weblogic', 'Database', 'DB2 Instance', 'JavaServer', 
'Database Instance', 'Sybase Instance', 'GlassFish', 'HBase Instance') AND TRGT.version_c ='UNSPECIFIED' THEN 'N'
 WHEN  (TRGT.ci_maintenance_schedule_c_key ='UNSPECIFIED') THEN 'N'
 ELSE 'Y' END <>TRGT.recommended_flag_c and SRC.cdctype<>'D'
 )temp;
