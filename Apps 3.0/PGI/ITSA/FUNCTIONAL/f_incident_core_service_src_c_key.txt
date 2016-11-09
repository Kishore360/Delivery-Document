SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM  pgi_mdwdb.f_incident trgt 
		JOIN (SELECT et.sys_id,et.sourceinstance,LEFT(et.u_product,32) as u_product from pgi_mdsdb.u_external_incident_final et
				UNION
			SELECT it.sys_id,it.sourceinstance,LEFT(it.u_product_s__affected,32) as u_product from pgi_mdsdb.u_internal_incident_final it)src
		ON trgt.row_id=src.sys_id and trgt.source_id=src.sourceinstance
		JOIN pgi_mdsdb.u_pgi_product_list_final refe
		ON src.u_product=refe.sys_id and src.sourceinstance=refe.sourceinstance
		JOIN pgi_mdwdb.d_lov lkp
		ON COALESCE(CONCAT('CORE_SERVICE~INCIDENT~~~',UPPER(refe.u_core_service)),'UNSPECIFIED') = lkp.row_id
		WHERE lkp.row_key<>trgt.core_service_src_c_key
		) tmp