SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM  pgi_mdwdb.f_incident trgt 
		JOIN (select inc.sys_id,inc.sourceinstance,inc.u_source from pgi_mdsdb.u_internal_incident_final inc
		UNION
		SELECT i2.sys_id,i2.sourceinstance,i2.u_source from pgi_mdsdb.incident_final i2) src
		ON trgt.row_id=src.sys_id and trgt.source_id=src.sourceinstance
		JOIN pgi_mdwdb.d_lov lkp
		ON COALESCE(CONCAT('SOURCE~INCIDENT~~~',upper(src.u_source)),'UNSPECIFIED') = lkp.row_id
		WHERE lkp.row_key<>trgt.source_name_c_key
		) tmp