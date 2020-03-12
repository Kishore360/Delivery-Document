SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_c.resolved_to_confirmed_cie_duration_c' ELSE 'SUCCESS' END as Message
FROM watson_mdwdb.f_incident f 
INNER JOIN watson_mdsdb.incident_final a 
ON f.row_id=a.sys_id and f.source_id=a.sourceinstance
JOIN watson_mdwdb.d_incident d
ON f.incident_key=d.row_key
JOIN watson_mdsdb.sys_audit_final saf 
ON saf.documentkey=a.sys_id 
AND saf.tablename='incident' AND saf.fieldname='u_confirmed_cie'
WHERE f.resolved_to_confirmed_cie_duration_c <> Coalesce(resolved_to_confirmed_cie_duration_c,CASE WHEN (a.resolved_at is null  or saf.sys_created_on is null) THEN NULL WHEN TIMESTAMPDIFF(SECOND,saf.sys_created_on,a.resolved_at ) < 0
										THEN NULL ELSE TIMESTAMPDIFF(SECOND,saf.sys_created_on,a.resolved_at) end)