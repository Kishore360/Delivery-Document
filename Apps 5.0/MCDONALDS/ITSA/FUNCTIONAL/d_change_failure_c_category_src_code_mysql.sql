SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.result_of_change_c_flag' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdsdb.change_request_final  SRC 
JOIN mcdonalds_mdwdb.d_change_failure_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE SRC.category<> (TRGT.category_src_code)


