SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM   pgi_mdwdb.d_incident trgt
        JOIN pgi_mdsdb.incident_final src
        ON trgt.row_id = src.sys_id AND trgt.source_id =src.sourceinstance
		JOIN 
		(SELECT sys_id,sourceinstance,left(u_product,32) as uxp from pgi_mdsdb.u_external_incident_final
		UNION
		SELECT sys_id,sourceinstance,left(u_product_s__affected,32) as uxp from pgi_mdsdb.u_internal_incident_final)
		ext
		ON src.sys_id = ext.sys_id and src.sourceinstance = ext.sourceinstance
		JOIN pgi_mdsdb.u_pgi_product_list_final pro
		ON ext.uxp=pro.sys_id and ext.sourceinstance = pro.sourceinstance
        WHERE  COALESCE(CASE WHEN pro.u_active=1 OR pro.u_change_management_option=1 THEN pro.u_name ELSE 'Non-Product' END,'UNSPECIFIED') <> trgt.product_name_c)tmp