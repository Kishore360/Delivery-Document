SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for work_end_on_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on LKP.row_id  = DATE_FORMAT(FROM_UNIXTIME(SRC.actual_end_date),'%Y%m%d') and LKP.source_id=0 
WHERE COALESCE(LKP.row_key, case when SRC.actual_end_date is null then 0 else -1 end)<> COALESCE(TRGT.work_end_on_key,'')
