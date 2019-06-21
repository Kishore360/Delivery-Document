SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.risk_src_code' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM mcdonalds_mdsdb.change_request_final SRC 
JOIN mcdonalds_mdwdb.f_change_request_failure_adv_c TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE( SRC.impact,'')<> COALESCE(TRGT.impact_src_code ,''))temp;


