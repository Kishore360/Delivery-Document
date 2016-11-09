SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM   pgi_mdwdb.d_incident trgt
        JOIN pgi_mdsdb.incident_final src
        ON trgt.row_id = src.sys_id AND trgt.source_id =src.sourceinstance
		LEFT JOIN pgi_mdsdb.u_external_incident_final ext
		ON src.sys_id = ext.sys_id and src.sourceinstance = ext.sourceinstance
        WHERE  COALESCE(CASE WHEN ext.u_pending_development_change = 1 THEN 'Y'ELSE 'N' END,'N') <> trgt.confirmed_production_defect_c)tmp 