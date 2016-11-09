SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM  pgi_mdwdb.f_incident trgt 
		JOIN pgi_mdsdb.incident_final src
		ON trgt.row_id=src.sys_id and trgt.source_id=src.sourceinstance
		JOIN pgi_mdwdb.d_lov lkp
		ON COALESCE(CONCAT('TICKET_INTIATED_FROM~INCIDENT~~~',upper(src.u_ticket_initiated_from)),'UNSPECIFIED') = lkp.row_id
		WHERE lkp.row_key<>trgt.ticket_initiated_from_c_key
		) tmp