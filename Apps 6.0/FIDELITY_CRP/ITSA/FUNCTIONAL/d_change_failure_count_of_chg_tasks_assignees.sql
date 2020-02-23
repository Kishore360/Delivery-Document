-- Def - Count of unique Assignees across CHG Tasks for a given CHG
-- If change_start_on>closed_on ,then the assignee_prior_changes value will be -1. ITSM-3636
-- Actual start date = work_start, planned_start_date - start_date, opened - opened_at
-- coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -1   ITSM-3632

-- SELECT SRC.sys_id, SRC.child_tasks_assig_count, TGT.count_of_chg_tasks_assignees

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.count_of_chg_tasks_assignees' ELSE 'SUCCESS' END as Message
from
(
select cr_1.sys_id, cr_1.sourceinstance,
case when coalesce(cr_1.work_start,cr_1.start_date,cr_1.opened_at) is NULL then -1  
when cr_2.child_flg=0 then -1
-- when cr_1.work_start>coalesce(cr_1.closed_at,'9999-01-01') then -1 
else cr_2.child_assig end as child_tasks_assig_count from

(
select sys_id,sourceinstance FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D'
) cr_1

left outer join

(
select cr.sys_id, cr.sourceinstance, count(distinct task.assigned_to) as child_assig, sum(case when task.change_request is not null then 1 else 0 end) as child_flg
from
(
select SRC.sys_id, SRC.closed_at, SRC.work_start, SRC.start_date, SRC.opened_at, SRC.sourceinstance, LKP.dimension_wh_code
from (SELECT sys_id,sourceinstance,closed_at, work_start, start_date, opened_at FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN fidelity_mdwdb.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
) cr
left outer join
(
select sys_id,sourceinstance,change_request,COALESCE(opened_at,work_start,planned_start_date) as task_dt, assigned_to from fidelity_mdsdb.change_task_final where change_request is not null 
) task
on  cr.sys_id=task.change_request and cr.sourceinstance=task.sourceinstance -- and cr.chg_dt>task.task_dt
group by cr.sys_id
) cr_2 

on  cr_1.sys_id= cr_2.sys_id and cr_1.sourceinstance=cr_2.sourceinstance

) SRC

left outer join 
(select row_id,source_id,count_of_chg_tasks_assignees FROM fidelity_mdwdb.d_change_failure where current_flag='Y') TGT
on SRC.sys_id = TGT.row_id
and SRC.sourceinstance = TGT.source_id

where coalesce(SRC.child_tasks_assig_count,0)<>coalesce(TGT.count_of_chg_tasks_assignees,0) -- and work_start is not null 
