SELECT 
CASE WHEN  cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN  cnt > 0 THEN 'd_inciden.incident_priority_downgraded_c_flag Failed'  ELSE 'SUCCESS' END AS MESSAGE
FROM 
(
SELECT count(1) as cnt  
FROM mcd_mdsdb.incident_final SRC
LEFT JOIN 
(SELECT distinct documentkey,sourceinstance,newvalue,oldvalue FROM 
mcd_mdsdb.sys_audit_final where tablename='incident' and fieldname='priority'
and Newvalue> oldvalue ) TA
ON (SRC.sys_id=TA.documentkey AND SRC.sourceinstance=TA.sourceinstance) 
JOIN mcd_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
CASE WHEN TA.documentkey is not NULL THEN 'Y' ELSE 'N' END<> TRGT.incident_priority_downgraded_c_flag
)temp;

