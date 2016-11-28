
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM
(
select count(1) as cnt from (
select exclude_task_c_flag , (case when inc_sug.sys_id is null then 'N' else inc_sug.exclude_inc_flag end ) from 
(select inc.sys_id,inc.sourceinstance, 
case when ((sug.name not like 'ITSM-LOB-Branchinfo%' and sug.name not like 'ITSM-LOB-HumanSystems%' and sug.name not like 'ITSM-LOB-CPS%'
 and sug.name not like 'ITSM-LOB-LoanServices%' and sug.name not like 'ITSM-LOB-Wealth%') or sug.name is  null)  then 'N' else 'Y' end as exclude_inc_flag
from bbandt_mdsdb.incident_final inc 
left join bbandt_mdsdb.sys_user_group_final sug on  inc.assignment_group = sug.sys_id)inc_sug
right join bbandt_mdsdb.sys_audit_final src on
src.documentkey = inc_sug.sys_id and src.sourceinstance = inc_sug.sourceinstance
join bbandt_mdwdb.f_t_task_activity trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance 
where  exclude_task_c_flag <> (case when inc_sug.sys_id is null then 'N' else inc_sug.exclude_inc_flag end ))b)d