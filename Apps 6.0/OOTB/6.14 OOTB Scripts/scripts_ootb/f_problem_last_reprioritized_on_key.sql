SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.last_reprioritized_on_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D') SRC 
 left join(select max(sys_created_on) as created_on,documentkey from #MDS_TABLE_SCHEMA.sys_audit_final where tablename='problem' and fieldname='priority'
 group by documentkey)audit
 on SRC.sys_id=audit.documentkey
 LEFT JOIN #DWH_TABLE_SCHEMA.f_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 where  date_format(COALESCE(convert_tz(audit.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')),'%Y%m%d')<> COALESCE(TRGT.last_reprioritized_on_key,'')

 
