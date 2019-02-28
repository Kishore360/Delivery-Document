SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_internal_organization.department_type_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as CNT from 
(select sys_id,sourceinstance,u_department, name from aetna_mdsdb.sys_user_group_final where CDCTYPE<>'D') f
left JOIN aetna_mdsdb.cmn_department_final a ON f.u_department=a.sys_id and f.sourceinstance=a.sourceinstance
left JOIN aetna_mdsdb.sys_user_final b on a.dept_head = b.sys_id and a.sourceinstance=b.sourceinstance
left JOIN aetna_mdsdb.sys_user_final lev2 on b.manager = lev2.sys_id and b.sourceinstance=lev2.sourceinstance
left JOIN aetna_mdsdb.sys_user_final lev3 on lev2.manager = lev3.sys_id and lev2.sourceinstance=lev3.sourceinstance
left JOIN aetna_mdsdb.sys_user_final lev4 on lev3.manager = lev4.sys_id and lev3.sourceinstance=lev4.sourceinstance
left JOIN aetna_mdsdb.sys_user_final lev5 on lev4.manager = lev5.sys_id and lev4.sourceinstance=lev5.sourceinstance
left JOIN  aetna_mdwdb.d_internal_organization trgt
on CONCAT('GROUP~',f.sys_id) = trgt.row_id and f.sourceinstance = trgt.source_id 
where CASE WHEN f.name = 'ECM Change Managers' then 'Application'
WHEN b.name in ('Eleanor Zaugg', 'James Routh') then 'Infrastructure' 
WHEN lev2.name in ('Eleanor Zaugg', 'James Routh') then 'Infrastructure' 
WHEN lev3.name in ('Eleanor Zaugg', 'James Routh') then 'Infrastructure' 
WHEN lev4.name in ('Eleanor Zaugg', 'James Routh') then 'Infrastructure' 
WHEN lev5.name in ('Eleanor Zaugg', 'James Routh') then 'Infrastructure' 
ELSE 'Application' END <> trgt.department_type_c)temp;