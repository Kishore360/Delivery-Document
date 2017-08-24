SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from (
SELECT SRC.sys_id,TRGT.row_id,SRC.assignment_group,SRC.opened_at ,SRC.sys_created_on,

coalesce(LKP.row_key,case when SRC.assignment_group is null then 0 else -1 end),TRGT.assignment_group_key
from (select *,COALESCE(concat('GROUP~',assignment_group),'UNSPECIFIED') as jn1 from molinahealth_mdsdb.task_final) SRC
join (select *,DATE_FORMAT(pivot_date, '%Y-%m-%d %H:%i:%s') as jn2 FROM molinahealth_mdwdb.f_task_c) TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join
molinahealth_mdwdb.d_internal_organization LKP
on SRC.jn1= LKP.row_id and TRGT.source_id=LKP.source_id
AND TRGT.jn2  BETWEEN LKP.effective_from AND LKP.effective_to
where coalesce(LKP.row_key,case when SRC.assignment_group is null then 0 else -1 end)<>TRGT.assignment_group_key

)a