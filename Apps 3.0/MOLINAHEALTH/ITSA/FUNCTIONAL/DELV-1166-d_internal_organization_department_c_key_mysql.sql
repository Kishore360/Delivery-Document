/*DELV-1166*/

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(SELECT mg_dep.sys_id, a12.row_id,mg_dep.manager,mg_dep.department_code,
coalesce(a16.row_key,case when mg_dep.department_code is null then 0 else -1 end ), a12.department_c_key, a12.soft_deleted_flag
FROM 
molinahealth_mdwdb.d_internal_organization a12 
JOIN
	(SELECT COALESCE(CONCAT('GROUP~',a14.sys_id),'UNSPECIFIED') as r_id,a14.manager,a13.department_code,sys_us.department,a14.sys_id,a14.sourceinstance, COALESCE(CONCAT('DEPARTMENT~',sys_us.department)) as jn3 from molinahealth_mdwdb.d_internal_contact a13
    JOIN (select *,COALESCE(CONCAT('INTERNAL_CONTACT~',sys_id),'UNSPECIFIED') as jk from molinahealth_mdsdb.sys_user_final) sys_us ON sys_us.jk = a13.row_id and sys_us.sourceinstance = a13.source_id
	JOIN (SELECT *,COALESCE(CONCAT('INTERNAL_CONTACT~',manager),'UNSPECIFIED') as jn2 FROM molinahealth_mdsdb.sys_user_group_final ) a14 ON a14.jn2 = a13.row_id and a13.source_id = a14.sourceinstance) mg_dep
ON a12.row_id = mg_dep.r_id and a12.source_id = mg_dep.sourceinstance
JOIN molinahealth_mdwdb.d_internal_organization a16 ON mg_dep.jn3 = a16.row_id and mg_dep.sourceinstance = a16.source_id
WHERE 
coalesce(a16.row_key,case when mg_dep.department_code is null then 0 else -1 end )<> a12.department_c_key)a

