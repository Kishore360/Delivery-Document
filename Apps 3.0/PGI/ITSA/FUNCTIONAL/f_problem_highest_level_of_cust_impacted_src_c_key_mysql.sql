SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM pgi_mdwdb.f_problem trgt
		JOIN pgi_mdsdb.problem_final src
		ON trgt.source_id = src.sourceinstance and trgt.row_id=src.sys_id
		JOIN pgi_mdwdb.d_lov lkp
		ON COALESCE(CONCAT('CUSTOMER_IMPACTED','~','PROBLEM','~','~','~',UPPER(src.u_highest_level_of_customer_im)),'UNSPECIFIED') = lkp.row_id 
		WHERE trgt.highest_level_of_cust_impacted_src_c_key <> lkp.row_key)tmp