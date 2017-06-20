SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.cmdb_ci_computer_final SRC 
 LEFT JOIN svb_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )where
os_version<>os_version_c or
os_service_pack<>os_service_pack_c or
cpu_count<>cpu_count_c or
ram<>ram_c or
disk_space<>disk_space_c