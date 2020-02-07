
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.change_caused_incident_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT  
FROM  fidelity_mdsdb.change_request_final a 
 JOIN  fidelity_mdsdb.incident_final b ON a.sys_id=b.u_caused_by_change AND a.sourceinstance =b.sourceinstance
JOIN fidelity_mdwdb.d_change_request c ON a.sys_id = c.row_id and a.sourceinstance=c.source_id
WHERE CASE WHEN b.u_caused_by_change IS NULL THEN 'N' ELSE 'Y' END<>c.caused_incident_flag_c and a.cdctype<>'D'
) temp;


