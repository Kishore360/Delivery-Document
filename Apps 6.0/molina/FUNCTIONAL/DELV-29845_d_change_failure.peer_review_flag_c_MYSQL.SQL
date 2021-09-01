SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.peer_review_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM "MOLINA_P_DB"."MDSDB"."CHANGE_REQUEST_FINAL" SRC 
LEFT JOIN mdw.d_change_failure TRGT ON SRC.sys_id =TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CASE WHEN SRC.u_peer_review=1 THEN 'Y' ELSE 'N' END <>TRGT.peer_review_flag_c
AND SRC.cdctype='X'
) temp; 


 