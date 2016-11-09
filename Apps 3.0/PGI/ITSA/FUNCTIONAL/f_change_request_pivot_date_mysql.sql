SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM pgi_mdwdb.f_change_request trgt
		JOIN pgi_mdsdb.change_request_final src
		ON trgt.source_id = src.sourceinstance and trgt.row_id=src.sys_id
		WHERE trgt.pivot_date <> COALESCE(CONVERT_TZ (src.sys_created_on,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'),CONVERT_TZ (src.closed_at,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#')))tmp