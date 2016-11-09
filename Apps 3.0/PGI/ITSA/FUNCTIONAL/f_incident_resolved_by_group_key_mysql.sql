SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM  pgi_mdwdb.f_incident trgt 
		JOIN (SELECT CONCAT('GROUP~',u_resolved_group)as u_resolved_group,sys_id,sourceinstance from pgi_mdsdb.incident_final) src
		ON trgt.row_id=src.sys_id and trgt.source_id=src.sourceinstance
		JOIN pgi_mdwdb.d_internal_organization lkp
		ON COALESCE(src.u_resolved_group,'UNSPECIFIED') = lkp.row_id
		WHERE lkp.row_key <> trgt.resolved_by_group_key
		) tmp
;