 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.ci_key' ELSE 'SUCCESS' END as Message
 -- select SRC.sys_id,SRC.WORK_START,SRC.START_DATE,SRC.OPENED_AT,  COALESCE(DATE_FORMAT(CONVERT_TZ(COALESCE(SRC.WORK_START,SRC.START_DATE,SRC.OPENED_AT),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%M%D'),'UNSPECIFIED'), coalesce(TRGT.change_start_on_key,'')
FROM ( SELECT SRC1.sys_id,SRC1.sourceinstance,approval,  Null as CHANGE_FAILURE_RISK, confitem.row_key as ci_key FROM #MDS_TABLE_SCHEMA.change_request_final SRC1 
 left outer join #DWH_TABLE_SCHEMA.d_configuration_item confitem
 on confitem.row_id= SRC1.cmdb_ci
 
 WHERE SRC1.CDCTYPE<>'D'
 ) SRC
 
 
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( CONCAT('APPROVAL','~','CHANGE_REQUEST','~',UPPER(approval)) = LKP.src_rowid 
 AND SRC.sourceinstance = LKP.source_id )
where SRC.ci_key<>TRGT.ci_key
