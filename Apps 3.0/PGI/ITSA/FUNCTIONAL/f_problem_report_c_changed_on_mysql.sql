SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM pgi_mdwdb.f_problem_report_c trgt
		JOIN pgi_mdsdb.u_problem_report_request_final src
		ON trgt.source_id = src.sourceinstance and trgt.row_id=src.sys_id
		WHERE trgt.changed_on <> CONVERT_TZ(src.sys_updated_on, 'GMT', 'UTC'))tmp