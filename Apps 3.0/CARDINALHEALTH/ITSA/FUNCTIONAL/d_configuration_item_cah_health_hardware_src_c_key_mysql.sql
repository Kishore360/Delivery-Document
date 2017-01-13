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
join cardinalhealth_mdwdb.d_lov lkp
on lkp.src_rowid=COALESCE(CONCAT('U_CAH_HEALTH_HARDWARE~CMDB_CI_APPLICATION','~','','~','','~',ccaf.u_cah_health_hardware),'UNSPECIFIED')
where  coalesce(lkp.row_key,case when ccaf.u_cah_health_hardware is null then 0 else -1 end) <> d.cah_health_hardware_src_c_key)c


