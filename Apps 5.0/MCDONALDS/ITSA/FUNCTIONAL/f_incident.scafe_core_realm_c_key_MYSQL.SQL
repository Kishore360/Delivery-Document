 
SELECT 
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for f_incident.scafe_core_realm_c_key' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as CNT
FROM ( SELECT * FROM mcdonalds_mdsdb.incident_final WHERE CDCTYPE<>'D') a 
JOIN mcdonalds_mdwdb.f_incident b ON (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
JOIN mcdonalds_mdwdb.d_scafe_core_realm_c LKP ON (a.x_scafe_core_realm=LKP.row_id and a.sourceinstance=LKP.source_id)
WHERE b.scafe_core_realm_c_key<>LKP.row_key
)tem;