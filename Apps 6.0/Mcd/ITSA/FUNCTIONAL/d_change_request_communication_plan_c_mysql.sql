SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.communication_plan_c' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_change_request trgt
RIGHT JOIN mcd_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE  u_communication_plan<>communication_plan_c
;