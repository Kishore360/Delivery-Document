select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for actual_duration from task_sla_final to f_task_sla' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_sla_final WHERE CDCTYPE<>'D') S

left join #DWH_TABLE_SCHEMA.f_task_sla DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where 
ifnull(CASE WHEN S.duration is null THEN NULL   
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',S.duration) < 0 THEN NULL    
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',S.duration) > 214748364 THEN NULL     
	 ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',S.duration) end,'') 
<> ifnull(DWH.actual_duration,'');
