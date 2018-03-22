SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM
(
select src.sys_id,trgt.row_id ,trgt.exclude_task_c_flag as target , (case when ((lkp.name not like 'ITSM-LOB-Branchinfo%' and lkp.name not like 'ITSM-LOB-HumanSystems%' and
 lkp.name not like 'ITSM-LOB-CPS%' and lkp.name not like 'ITSM-LOB-LoanServices%' and lkp.name not like 'ITSM-LOB-Wealth%') or lkp.name is  null) then 'N' else 'Y' end ) 
as source
from  (select sys_id,sourceinstance,assignment_group from bbandt_mdsdb.task_final where sys_class_name='INCIDENT') src 
join bbandt_mdwdb.d_task trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance
left join bbandt_mdsdb.sys_user_group_final lkp on  src.assignment_group = lkp.sys_id and src.sourceinstance = lkp.sourceinstance
WHERE trgt.exclude_task_c_flag  <> (case when ((lkp.name not like 'ITSM-LOB-Branchinfo%' and lkp.name not like 'ITSM-LOB-HumanSystems%' and
 lkp.name not like 'ITSM-LOB-CPS%' and lkp.name not like 'ITSM-LOB-LoanServices%' and lkp.name not like 'ITSM-LOB-Wealth%') or lkp.name is  null) then 'N' else 'Y' end ))b ;
