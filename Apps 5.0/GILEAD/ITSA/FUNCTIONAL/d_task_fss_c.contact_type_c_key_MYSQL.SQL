SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
select count(1) as cnt
from  gilead_mdsdb.u_task_fss_final src
join gilead_mdwdb.d_task_fss_c trgt
ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join gilead_mdwdb.d_lov lkp
on CONCAT('CONTACT_TYPE_C~TASK_FSS_C~~~',src.contact_type)=lkp.row_id 
and src.sourceinstance=lkp.source_id
where coalesce( lkp.row_key,case when src.contact_type is null then 0 else -1 end)<>trgt.contact_type_c_key
)ma;

