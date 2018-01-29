<<<<<<< HEAD
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
=======
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application.application_dr_enabled_c_key' ELSE 'SUCCESS' END as Message 
FROM rogersdev_mdsdb.cmdb_ci_appl_final  SRC 
JOIN rogersdev_mdwdb.d_application TRGT 
ON (concat('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN rogersdev_mdwdb.d_lov LKP 
 ON ( COALESCE(CONCAT('DRENABLED','~','CMDB_CI_APPL','~','~','~',UPPER(SRC.u_dr_enabled)),'UNSPECIFIED') = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_dr_enabled IS NULL THEN 0 else -1 end)<> (TRGT.application_dr_enabled_c_key) 
>>>>>>> 54d361e3db7741fe3d518a6787e7829f3e895dba
