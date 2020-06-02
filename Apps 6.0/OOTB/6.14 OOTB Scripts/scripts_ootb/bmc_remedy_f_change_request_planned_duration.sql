SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
on (LM.src_key=TRGT.state_src_key
and LM.dimension_class='STATE~CHANGE_REQUEST')
WHERE LM.dimension_wh_code <> 'CANCELED' and COALESCE(CASE WHEN  SRC.Scheduled_End_Date<SRC.Scheduled_Start_Date THEN NULL 
ELSE TIMESTAMPDIFF(SECOND, SRC.Scheduled_End_Date,SRC.Scheduled_Start_Date) END ,'')
<>COALESCE(TRGT.planned_duration,'')