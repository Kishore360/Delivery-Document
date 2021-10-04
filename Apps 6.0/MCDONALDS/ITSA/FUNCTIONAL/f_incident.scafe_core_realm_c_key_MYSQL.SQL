 
SELECT 
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for f_incident.scafe_core_realm_c_key' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as CNT
FROM mcd_mdsdb.incident_final a 
JOIN mcd_mdwdb.f_incident b ON (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
JOIN mcd_mdwdb.d_scafe_core_realm_c LKP ON (a.x_scafe_core_realm=LKP.row_id and a.sourceinstance=LKP.source_id)
WHERE b.scafe_core_realm_c_key<>LKP.row_key
)tem;