SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM pgi_mdwdb.f_problem trgt
		JOIN pgi_mdsdb.problem_final src
		ON trgt.source_id = src.sourceinstance and trgt.row_id=src.sys_id
		JOIN pgi_mdwdb.d_calendar_time lkp
		ON coalesce(DATE_FORMAT(CONVERT_TZ(src.sys_created_on,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'),'%H%i'),'UNSPECIFIED') = lkp.row_id 
		WHERE trgt.opened_time_key <> lkp.row_key)tmp