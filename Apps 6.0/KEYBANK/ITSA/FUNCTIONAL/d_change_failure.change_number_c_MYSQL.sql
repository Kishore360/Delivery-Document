
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.change_number_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM keybank_mdsdb.change_request_final SRC 
LEFT JOIN keybank_mdwdb.d_change_failure TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE coalesce(SRC.number,'UNSPECIFIED')<>TRGT.change_number_c
AND SRC.cdctype='X' ) temp;
