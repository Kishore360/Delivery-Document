select case when count(1) then 'FAILURE' else 'SUCCESS' end as RESULT,
case when count(1) then 'Data Mismatch' else 'SUCCESS' end as Message
from ( select a.sys_id,b.row_id rowid,a.sourceinstance,b.source_id sourceid,a.u_value,b.value
from gilead_mdsdb.u_sparc_category_choices_final a
join gilead_mdwdb.d_sparc_category_choices_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where coalesce(a.u_value,'UNSPECIFIED')<>b.value
and b.soft_deleted_flag='N')a;