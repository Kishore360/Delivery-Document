SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.closed_on' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_case TRGT 
 ON (SRC.sys_id  =TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  )
 WHERE convert_tz(SRC.closed_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <> TRGT.closed_on 
