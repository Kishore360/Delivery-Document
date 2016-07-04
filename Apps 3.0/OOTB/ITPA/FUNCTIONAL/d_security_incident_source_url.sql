
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_security_incident.source_url' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.sn_si_incident_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_security_incident TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(CONCAT('<a href=\"#URL\/SRC.do?SRC.sys_id=',SRC.sys_id,'\" style=\"text-decoration:none;color:#f01a1a;\" target=\"_blank\"  title=\"Check in ServiceNow\">\\\\\\\u24D8</a>') ,'')<> COALESCE(TRGT.source_url ,'')
