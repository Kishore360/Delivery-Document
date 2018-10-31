SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_organization.department_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(select sys_id,sourceinstance,u_department from  aetna_mdsdb.sys_user_group_final where CDCTYPE<>'D') s 
left join aetna_mdwdb.d_internal_organization f on s.sys_id=f.row_id and  s.sourceinstance=f.source_id
where coalesce(concat('DEPARTMENT~',s.u_department),'UNSPECIFIED')<>f.department_c_key;