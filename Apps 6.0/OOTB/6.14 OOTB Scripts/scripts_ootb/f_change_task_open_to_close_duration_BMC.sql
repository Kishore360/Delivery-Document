SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC
left join (SELECT * FROM  #DWH_TABLE_SCHEMA.f_change_task where soft_deleted_flag='N') TRGT 
ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP
 on concat('STATE','~','CHANGE_TASK','~',upper(SRC.status)) = LKP.src_rowid 
WHERE case when LKP.dimension_wh_code='CLOSED' THEN
		CASE WHEN SRC.create_date <= COALESCE( SRC.actual_end_date,SRC.modified_date) then COALESCE( TIMESTAMPDIFF(SECOND, SRC.create_date, 
			COALESCE( SRC.actual_end_date,SRC.modified_date)) ,'') else '' end
	  else '' end
<> COALESCE(TRGT.open_to_close_duration ,'')