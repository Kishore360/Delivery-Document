SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'Data mismatch' ELSE 'SUCCESS' END as Message
-- select src.Resource_ID, trgt.row_id,src.Resource_Role,trgt.resource_role
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.Resource_ID = trgt.row_id and src.sourceinstance = trgt.source_id
where src.Resource_Role<>trgt.resource_role;