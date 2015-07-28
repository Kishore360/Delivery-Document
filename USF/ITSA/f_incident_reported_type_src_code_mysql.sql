

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
 from usf_mdwdb.f_incident fi
JOIN usf_mdsdb.incident_final f ON (fi.row_id =f.sys_id)
where fi.reported_type_src_code <> f.u_source