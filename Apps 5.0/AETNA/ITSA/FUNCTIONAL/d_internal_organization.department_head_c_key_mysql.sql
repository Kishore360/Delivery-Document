SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_internal_organization.department_head_c_key' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as CNT from 
(select sys_id,sourceinstance,u_department from aetna_mdsdb.sys_user_group_final where CDCTYPE<>'D') src
left join aetna_mdsdb.cmn_department_final a ON src.u_department=a.sys_id and src.sourceinstance=a.sourceinstance
left JOIN  aetna_mdwdb.d_internal_organization trgt
on CONCAT('GROUP~',src.sys_id) = trgt.row_id and src.sourceinstance = trgt.source_id 
left join aetna_mdwdb.d_internal_contact lkp on COALESCE(CONCAT('INTERNAL_CONTACT~',a.dept_head),'UNSPECIFIED')=lkp.row_id
where coalesce(lkp.row_key,case when a.dept_head is null then 0 else -1 end) <> trgt.department_head_c_key)temp;