SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.impact_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM keybank_mdsdb.change_request_final SRC 
LEFT JOIN keybankcrp_mdwdb.d_change_failure TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE case when SRC.impact=1 then '1 - Very High' when SRC.impact=2 then '2 - High' when 
SRC.impact=3 then '3 - Medium' when SRC.impact=4 then '4 - Low' else 'UNSPECIFIED' END<>TRGT.impact_c
AND SRC.cdctype='X' ) temp;
