

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
	svb_mdsdb.incident_final a11
LEFT JOIN 
	svb_mdsdb_mdwdb.f_incident TRGT 
	ON (a11.sys_id =TRGT.row_id AND a11.sourceinstance= TRGT.source_id  )
LEFT JOIN 
	svb_mdwdb.d_incident LKP 
	on DATE_FORMAT(CONVERT_TZ (a11.u_acknowledged_at,'GMT','America/Los_Angeles'),'%Y%m%d')
	= LKP.row_id and LKP.source_id=SRC.sourceinstance
WHERE  COALESCE(LKP.row_key,CASE WHEN a11.u_acknowledged_at IS NULL THEN 0 else -1 end)<> TRGT.acknowledged_at_c_key
