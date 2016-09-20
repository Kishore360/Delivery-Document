
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 case when count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assignment_group_key' ELSE 'SUCCESS' 
END as Message
from  tivo_mdsdb.sc_req_item_final src
left JOIN tivo_mdwdb.f_request trgt
on (src.sys_id =trgt.row_id AND src.sourceinstance= trgt.source_id)
LEFT JOIN tivo_mdwdb.d_internal_organization o
ON  CONCAT('GROUP~', src.assignment_group)= o.row_id and src.sourceinstance=o.source_id
WHERE 
COALESCE(o.row_key,CASE WHEN src.assignment_group IS NULL THEN 0 else -1 end)<> (trgt.assignment_group_key)
;