SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM  pgi_mdwdb.f_incident trgt 
		JOIN pgi_mdsdb.incident_final src
		ON trgt.row_id=src.sys_id and trgt.source_id=src.sourceinstance
		WHERE CONVERT_TZ(src.sys_created_on,'GMT','UTC')<>trgt.pivot_date
		) tmp