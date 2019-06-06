select case when count(1) then 'FAILURE' else 'SUCCESS' end as RESULT,
case when count(1) then 'Data Mismatch' else 'SUCCESS' end as Message
from ( select a.sys_id,b.row_id,a.sourceinstance,b.source_id,a.short_description,b.short_desc
from gilead_mdsdb.cmdb_model_final a
join gilead_mdwdb.d_product_model b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where coalesce(a.short_description,'UNSPECIFIED')<>b.short_desc
and b.soft_deleted_flag='N')a;