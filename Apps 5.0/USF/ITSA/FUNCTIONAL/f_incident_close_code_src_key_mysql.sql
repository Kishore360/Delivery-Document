  SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from usf_mdwdb.f_incident fi JOIN
usf_mdsdb.incident_final f ON fi.row_id = f.sys_id where
fi.close_code_src_code <> f.u_closure_code
and fi.close_code_src_code <> COALESCE( CONCAT('CLOSE_CODE','~','INCIDENT','~','~','~',UPPER(f.u_closure_code )),'UNSPECIFIED')
) c