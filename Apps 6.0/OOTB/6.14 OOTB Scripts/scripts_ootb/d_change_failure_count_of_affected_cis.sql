
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_failure.count_of_affected_cis' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
 LEFT JOIN (select task, sourceinstance, count(*) as no_of_task_cis from #MDS_TABLE_SCHEMA.task_ci_final where task is not null group by task, sourceinstance) task_ci 
 ON (task_ci.task = SRC.sys_id
 AND SRC.sourceinstance = task_ci.sourceinstance )
 WHERE COALESCE(task_ci.no_of_task_cis,0)<> COALESCE(TRGT.count_of_affected_cis,'')
