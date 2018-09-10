SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.flag_for_cab_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) AS CNT 
FROM equifax_mdsdb.change_request_final SRC 
LEFT JOIN equifax_mdwdb.d_change_request TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CASE WHEN SRC.u_flag_for_cab=1 THEN 'Y' ELSE 'N' END =TRGT.flag_for_cab_c
) temp;


