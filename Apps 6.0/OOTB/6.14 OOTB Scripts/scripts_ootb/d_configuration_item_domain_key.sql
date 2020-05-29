SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.domain_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') SRC 
 Left join ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_service_final WHERE CDCTYPE<>'D') SRC3
ON SRC.sys_id=SRC3.sys_id 
AND SRC.sourceinstance=SRC3.sourceinstance 
left join #DWH_TABLE_SCHEMA.d_domain LKP
on LKP.row_id = SRC.sys_domain
and LKP.source_id = SRC.sourceinstance
 LEFT JOIN #DWH_TABLE_SCHEMA.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( LKP.row_key, case when SRC.sys_domain is NULL then 0 else -1 end,'')<> COALESCE(TRGT.domain_key ,'')