SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.confirmed_cie_to_open_duration_c' ELSE 'SUCCESS' END as Message
FROM watson_mdwdb.f_incident f 
INNER JOIN watson_mdsdb.incident_final a 
ON f.row_id=a.sys_id and f.source_id=a.sourceinstance
JOIN watson_mdwdb.d_incident d
ON f.incident_key=d.row_key
JOIN watson_mdsdb.sys_audit_final saf 
ON saf.documentkey=a.sys_id 
AND saf.tablename='incident' AND saf.fieldname='u_confirmed_cie'
WHERE f.confirmed_cie_to_open_duration_c <> CASE WHEN (a.opened_at is null  or saf.sys_created_on is null) THEN NULL WHEN TIMESTAMPDIFF(SECOND,a.opened_at ,saf.sys_created_on) < 0
THEN NULL ELSE TIMESTAMPDIFF(SECOND,a.opened_at,saf.sys_created_on ) end
and a.u_confirmed_cie = 1 and a.cdctype='X';