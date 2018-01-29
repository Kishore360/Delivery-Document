SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
rogersdev_mdwdb.d_application a
join
rogersdev_mdsdb.cmdb_ci_appl_final  b
on a.row_id = concat('APPLICATION~',b.sys_id) and a.source_id = b.sourceinstance
join
rogersdev_mdwdb.d_lov c
on COALESCE(CONCAT('DRENABLED~CMDB_CI_APPL~~~',b.u_dr_enabled),'UNSPECIFIED')=c.row_id
where COALESCE(c.row_key,case when b.u_dr_enabled is null then 0 else -1 end ) <> a.application_dr_enabled_c_key)a