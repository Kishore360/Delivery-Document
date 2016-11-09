SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM pgi_mdwdb.f_problem trgt
		JOIN pgi_mdsdb.problem_final src
		ON trgt.source_id = src.sourceinstance and trgt.row_id=src.sys_id
		JOIN pgi_mdwdb.d_problem lkp
		ON COALESCE(src.u_duplicate_problem_number,'UNSPECIFIED') = lkp.row_id 
		WHERE trgt.duplicate_problem_number_c_key <> lkp.row_key)tmp