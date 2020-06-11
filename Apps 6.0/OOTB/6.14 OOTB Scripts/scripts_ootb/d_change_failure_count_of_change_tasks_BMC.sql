--Failing for scheduled_start_date is NULL then populaitng as 0
SELECT  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.count_of_change_tasks' ELSE 'SUCCESS' END as Message
from
(
select cr_1.infrastructure_change_id, cr_1.sourceinstance,
case when cr_1.scheduled_start_date is NULL then -1  
else cr_2.child_tasks end as   child_tasks_count from

(
select * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D'
) cr_1

left outer join

(
select cr.infrastructure_change_id, cr.sourceinstance,count(task.Task_ID) as child_tasks 
from
(
select SRC.infrastructure_change_id, SRC.closed_date, SRC.scheduled_start_date, SRC.sourceinstance, LKP.dimension_wh_code,
SRC.scheduled_start_date as chg_dt
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(change_request_status)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
) cr
left outer join
(
select Task_ID,sourceinstance,rootrequestid, create_date as task_dt from #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change' and  rootrequestid is not null 
) task
on  cr.infrastructure_change_id=task.rootrequestid and cr.sourceinstance=task.sourceinstance and cr.chg_dt>task.task_dt
group by cr.infrastructure_change_id
) cr_2 

on  cr_1.infrastructure_change_id= cr_2.infrastructure_change_id and cr_1.sourceinstance=cr_2.sourceinstance

) SRC

left outer join 
(select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') TGT
on SRC.infrastructure_change_id = TGT.row_id
and SRC.sourceinstance = TGT.source_id

where coalesce(SRC.child_tasks_count,0)<>coalesce(TGT.count_of_change_tasks,0) -- and work_start is not null 
