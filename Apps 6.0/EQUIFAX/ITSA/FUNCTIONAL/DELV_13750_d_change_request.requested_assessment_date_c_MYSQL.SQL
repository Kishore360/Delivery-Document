SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.requested_assessment_date_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) AS CNT 
FROM equifax_mdsdb.change_request_final SRC 
LEFT JOIN equifax_mdwdb.d_change_request TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CONVERT_TZ(SRC.u_requested_assessment_date,'GMT','America/New_York')<>TRGT.requested_assessment_date_c
) temp;



 


 