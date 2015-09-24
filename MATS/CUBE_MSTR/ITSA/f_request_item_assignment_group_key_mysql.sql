
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 case when count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.assignment_group_key' ELSE 'SUCCESS' 
END as Message
from  <<tenant>>_mdsdb.sc_req_item_final src
left JOIN <<tenant>>_mdwdb.f_request_item trgt
on (src.sys_id =trgt.row_id AND src.sourceinstance= trgt.source_id)
LEFT JOIN <<tenant>>_mdwdb.d_internal_organization o
ON ( COALESCE(CONCAT('GROUP~', src.assignment_group),'UNSPECIFIED')= o.row_id)
WHERE 
COALESCE(o.row_key,CASE WHEN src.assignment_group IS NULL THEN 0 else '-1' end)<> COALESCE(trgt.assignment_group_key,'')
;