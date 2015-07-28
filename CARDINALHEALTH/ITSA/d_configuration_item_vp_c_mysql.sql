SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.sys_user_final a
left join 
cardinalhealth_mdwdb.d_configuration_item b 
on a.sys_id=b.row_id and b.source_id=a.sourceinstance
where b.vp_c <> CONCAT_WS(' ',a.first_name,a.last_name);
