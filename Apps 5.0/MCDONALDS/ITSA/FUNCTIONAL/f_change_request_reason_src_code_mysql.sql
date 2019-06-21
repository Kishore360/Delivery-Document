SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.reason_src_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.f_change_request trgt
RIGHT JOIN mcdonalds_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE u_reason <> reason_src_code;