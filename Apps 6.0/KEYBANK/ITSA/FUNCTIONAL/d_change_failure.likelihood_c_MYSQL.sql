SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.likelihood_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM keybank_mdsdb.change_request_final SRC 
LEFT JOIN keybank_mdwdb.d_change_failure TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE case when SRC.u_likelihood=1 then '1 - High' when SRC.u_likelihood=2 then '2 - Medium'
when  SRC.u_likelihood=3 then '3 - Low' else 'UNSPECIFIED' end<>TRGT.likelihood_c
AND SRC.cdctype='X'  and TRGT.current_flag='Y') temp;