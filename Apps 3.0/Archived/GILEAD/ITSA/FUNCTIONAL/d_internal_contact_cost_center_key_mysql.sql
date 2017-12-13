
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from   gilead_mdsdb.sys_user_final src
left join gilead_mdwdb.d_internal_contact trgt on src.sys_id=right(trgt.row_id,32) and src.sourceinstance=trgt.source_id
left join gilead_mdwdb.d_cost_center dic on COALESCE(src.cost_center,'UNSPECIFIED')=dic.row_id
where dic.row_key<>trgt.cost_center_key


