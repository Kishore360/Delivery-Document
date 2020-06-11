	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed planned_start_on_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join #DWH_TABLE_SCHEMA.d_calendar_date LKP
 on DATE_FORMAT(FROM_UNIXTIME(SRC.Scheduled_start_Date),'%Y%m%d') = LKP.row_id and LKP.source_id = 0
WHERE COALESCE( LKP.row_key, case when SRC.scheduled_start_date is null then 0 else -1 end)<> COALESCE(TRGT.planned_start_on_key,'')