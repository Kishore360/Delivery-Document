SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_start_on' ELSE 'SUCCESS' END as Message
FROM ( SELECT *, Null as CHANGE_FAILURE_RISK  FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( CONCAT('APPROVAL','~','CHANGE_REQUEST','~',UPPER(approval)) = LKP.src_rowid 
 AND SRC.sourceinstance = LKP.source_id )
WHERE  coalesce(CONVERT_TZ(COALESCE(SRC.WORK_START,SRC.START_DATE,SRC.OPENED_AT),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> coalesce(TRGT.change_start_on,'')
 