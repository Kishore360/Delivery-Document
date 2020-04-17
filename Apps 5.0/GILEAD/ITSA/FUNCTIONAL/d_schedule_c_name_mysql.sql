select case when count(1) then 'FAILURE' else 'SUCCESS' end as RESULT,
case when count(1) then 'Data Mismatch' else 'SUCCESS' end as Message
from ( select a.sys_id,b.row_id,a.sourceinstance,b.source_id,a.name name_src,b.name name_trgt
from gilead_mdsdb.cmn_schedule_final a
join gilead_mdwdb.d_schedule_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where coalesce(a.name,'UNSPECIFIED')<>b.name
and b.soft_deleted_flag='N')a;

