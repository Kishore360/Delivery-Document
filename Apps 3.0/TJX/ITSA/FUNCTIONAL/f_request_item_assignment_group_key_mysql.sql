SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.assignment_group_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT  
from  tjx_mdsdb.sc_req_item_final src
left JOIN tjx_mdwdb.f_request_item trgt
on (src.sys_id =trgt.row_id AND src.sourceinstance= trgt.source_id)
LEFT JOIN tjx_mdwdb.d_internal_organization o
ON  CONCAT('GROUP~', src.assignment_group)= o.row_id and src.sourceinstance=o.source_id
 join tjx_mdwdb.d_request_item a19 on (TRGT.request_item_key = a19.row_key)  where category_name_c in ('ARMS') and 
COALESCE(o.row_key,CASE WHEN src.assignment_group IS NULL THEN 0 else -1 end)<> (trgt.assignment_group_key))temp;