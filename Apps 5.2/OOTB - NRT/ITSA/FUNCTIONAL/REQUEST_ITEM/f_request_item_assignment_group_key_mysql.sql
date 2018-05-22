SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.assignment_group_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT  
from  <<tenant>>_mdsdb.sc_req_item_final src
left JOIN <<tenant>>_mdwdb.f_request_item trgt
on (src.sys_id =trgt.row_id AND src.sourceinstance= trgt.source_id)
LEFT JOIN <<tenant>>_mdwdb.d_internal_organization o
ON  CONCAT('GROUP~', src.assignment_group)= o.row_id and src.sourceinstance=o.source_id
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
WHERE (SRC.cdctime<=f1.lastupdated) and 
COALESCE(o.row_key,CASE WHEN src.assignment_group IS NULL THEN 0 else -1 end)<> (trgt.assignment_group_key))temp;