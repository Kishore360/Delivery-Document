select count(*) from usf_mdwdb.f_incident fi JOIN
usf_mdsdb.incident_final f ON fi.row_id = f.sys_id where
fi.close_code_src_code = f.u_closure_code
or fi.close_code_src_code = COALESCE( CONCAT('CLOSE_CODE','~','INCIDENT','~','~','~',UPPER(f.u_closure_code )),'UNSPECIFIED');