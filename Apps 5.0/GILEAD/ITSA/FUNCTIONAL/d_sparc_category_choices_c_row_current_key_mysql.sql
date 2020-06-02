select case when count(1) then 'FAILURE' else 'SUCCESS' end as RESULT,
case when count(1) then 'Data Mismatch' else 'SUCCESS' end as Message
from ( select a.sys_id,b.row_id rowid,a.sourceinstance,b.source_id sourceid,c.row_id rowid_trgt,c.source_id sourceid_trgt,b.row_key,c.row_current_key
from gilead_mdsdb.u_sparc_category_choices_final a
join gilead_mdwdb.d_sparc_category_choices_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join gilead_mdwdb.d_sparc_category_choices_c c
on b.row_id=c.row_id and b.source_id=c.source_id
where coalesce(b.row_key,case when a.sys_id is null then 0 else -1 end)<>c.row_current_key
and b.soft_deleted_flag='N')a;
