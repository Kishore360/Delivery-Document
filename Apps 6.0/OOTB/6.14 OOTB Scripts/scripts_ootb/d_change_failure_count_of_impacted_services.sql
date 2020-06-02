
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_failure.count_of_impacted_services' ELSE 'SUCCESS' END as Message
from 
(
select SRC.sys_id, SRC.sourceinstance, count(task) AS cnt_impacted_services from
(SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN (select *  from #MDS_TABLE_SCHEMA.task_cmdb_ci_service_final) task_ci 
 ON (task_ci.task = SRC.sys_id
 AND SRC.sourceinstance = task_ci.sourceinstance)
group by SRC.sys_id, SRC.sourceinstance
) SRC1
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC1.sys_id =TRGT.row_id 
	AND SRC1.sourceinstance =TRGT.source_id )
 WHERE COALESCE(SRC1.cnt_impacted_services,0)<> COALESCE(TRGT.count_of_impacted_services,'')
