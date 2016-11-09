SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM  pgi_mdwdb.f_incident trgt 
		JOIN (SELECT CONCAT('GROUP~',u_assigned_fix_agent)as u_assigned_fix_agent,sys_id,sourceinstance from pgi_mdsdb.u_internal_incident_final) src
		ON trgt.row_id=src.sys_id and trgt.source_id=src.sourceinstance
		JOIN pgi_mdwdb.d_internal_organization lkp
		ON COALESCE(src.u_assigned_fix_agent,'UNSPECIFIED') = lkp.row_id
		WHERE lkp.row_key <> trgt.assigned_resolver_group_c_key
		) tmp
;