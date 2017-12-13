select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from gilead_mdsdb.sys_user_group_final src
left join gilead_mdwdb.d_internal_contact dic on concat('INTERNAL_CONTACT~',manager)=dic.row_id
left join gilead_mdwdb.d_internal_organization trgt on src.sys_id=right(trgt.row_id,32) and src.sourceinstance=trgt.source_id
where dic.row_key<>trgt.manager_c_key