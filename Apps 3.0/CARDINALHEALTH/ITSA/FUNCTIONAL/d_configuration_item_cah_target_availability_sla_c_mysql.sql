 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
cardinalhealth_mdwdb.d_configuration_item d
JOIN cardinalhealth_mdsdb.cmdb_ci_final t ON d.row_id = t.sys_id
	AND d.source_id=t.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.cmdb_ci_application_final ccaf ON d.row_id = ccaf.sys_id
	AND d.source_id=ccaf.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.sys_user_final suo ON t.owned_by=suo.sys_id
	AND t.sourceinstance=suo.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.sys_user_final svp ON suo.u_vp=svp.sys_id
	AND svp.sourceinstance=suo.sourceinstance

where  d.cah_target_availability_sla_c<>(ccaf.u_cah_target_availability_sla*100))c


