SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM  pgi_mdwdb.f_incident trgt 
		JOIN pgi_mdsdb.u_external_incident_final src
		ON trgt.row_id=src.sys_id and trgt.source_id=src.sourceinstance
		WHERE src.u_service_level<>trgt.service_level_src_code
		) tmp