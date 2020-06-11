
-- If change_start_on>closed_on ,then the assignee_prior_changes value will be -1. ITSM-3636
-- Actual start date = work_start, planned_start_date - start_date, opened - opened_at
-- coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -1   ITSM-3632

-- SELECT SRC.sys_id, SRC.child_tasks_assig_grp_count, TGT.count_of_chg_tasks_assignment_groups

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.count_of_chg_tasks_assignment_groups' ELSE 'SUCCESS' END as Message
from
(
select cr_1.sys_id, cr_1.sourceinstance,
case when coalesce(cr_1.work_start,cr_1.start_date,cr_1.opened_at) is NULL then -1  
-- when cr_1.work_start>coalesce(cr_1.closed_at,'9999-01-01') then -1 
when cr_2.child_flg=0 then -1
else cr_2.child_assig end as child_tasks_assig_grp_count from

(
select * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D'
) cr_1

left outer join

(
select cr.sys_id, cr.sourceinstance, count(distinct task.assignment_group) as child_assig,
sum(case when task.change_request is not null then 1 else 0 end) as child_flg
from
(
select SRC.sys_id, SRC.closed_at, SRC.work_start, SRC.start_date, SRC.opened_at, SRC.sourceinstance, LKP.dimension_wh_code
from (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
) cr
left outer join
(
select sys_id,sourceinstance,change_request,COALESCE(opened_at,work_start,planned_start_date) as task_dt, assignment_group from #MDS_TABLE_SCHEMA.change_task_final where change_request is not null 
) task
on  cr.sys_id=task.change_request and cr.sourceinstance=task.sourceinstance -- and cr.chg_dt>task.task_dt
group by cr.sys_id
) cr_2 

on  cr_1.sys_id= cr_2.sys_id and cr_1.sourceinstance=cr_2.sourceinstance

) SRC

left outer join 
(select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') TGT
on SRC.sys_id = TGT.row_id
and SRC.sourceinstance = TGT.source_id

where coalesce(SRC.child_tasks_assig_grp_count,0)<>coalesce(TGT.count_of_chg_tasks_assignment_groups,0) 
