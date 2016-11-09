SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM pgi_mdwdb.f_problem trgt
		JOIN pgi_mdsdb.problem_final src
		ON trgt.source_id = src.sourceinstance and trgt.row_id=src.sys_id
		JOIN pgi_mdwdb.d_lov lkp
		ON COALESCE(CONCAT('ROOT_CAUSE_CATEGORY','~','PROBLEM','~','~','~',UPPER(src.u_root_cause_category)),'UNSPECIFIED') = lkp.row_id 
		WHERE trgt.root_cause_category_src_c_key <> lkp.row_key)tmp