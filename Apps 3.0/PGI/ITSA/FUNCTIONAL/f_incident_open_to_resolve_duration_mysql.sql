SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM  pgi_mdwdb.f_incident trgt 
		JOIN pgi_mdsdb.incident_final src
		ON trgt.row_id=src.sys_id and trgt.source_id=src.sourceinstance
		WHERE TIMESTAMPDIFF(SECOND,CONVERT_TZ(src.sys_created_on,'GMT','UTC'),CONVERT_TZ(src.u_resolved,'GMT','UTC'))<>trgt.open_to_resolve_duration
		) tmp