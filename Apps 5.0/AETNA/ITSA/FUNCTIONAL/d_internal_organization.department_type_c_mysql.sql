SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_internal_organization.department_type_c' ELSE 'SUCCESS' END as Message 
FROM
(
select count(1) as CNT from aetna_mdwdb.d_internal_organization a11
left join 
(select concat('GROUP~',a11.sys_id) as sys_id ,a11.sourceinstance,a11.name as assignment_group_name,a11.manager,a22.name as assignment_group_manager_name,
a33.name as department_name,a33.dept_head,a44.name as department_head,a55.name  as level_2,a66.name as level_3
 ,a77.name as level_4, a88.name as level_5,a99.name as level_6
 from aetna_mdsdb.sys_user_group_final a11 
 left join aetna_mdsdb.sys_user_final a22 on a11.manager=a22.sys_id and a11.sourceinstance=a22.sourceinstance
 left join aetna_mdsdb.cmn_department_final a33 on  a22.department=a33.sys_id  and a22.sourceinstance=a33.sourceinstance
 left join aetna_mdsdb.sys_user_final a44 on a44.sys_id=a33.dept_head and  a44.sourceinstance=a33.sourceinstance
 left join aetna_mdsdb.sys_user_final a55 on a55.sys_id=a44.manager and  a55.sourceinstance=a44.sourceinstance
 left join aetna_mdsdb.sys_user_final a66 on a66.sys_id=a55.manager and  a66.sourceinstance=a55.sourceinstance
  left join aetna_mdsdb.sys_user_final a77 on a77.sys_id=a66.manager and  a77.sourceinstance=a66.sourceinstance
   left join aetna_mdsdb.sys_user_final a88 on a88.sys_id=a77.manager and  a88.sourceinstance=a77.sourceinstance
   left join aetna_mdsdb.sys_user_final a99 on a99.sys_id=a88.manager and  a99.sourceinstance=a88.sourceinstance
 where a11.manager is not null)der
 on  a11.row_id=der.sys_id and a11.source_id=der.sourceinstance
 where  (a11.department_type_c<>  case when 
    coalesce(der.level_5,'UNSPECIFIED') in ('Robert Tobin','Bobby Mukundan')
 or coalesce(der.level_4,'UNSPECIFIED') in ('Robert Tobin','Bobby Mukundan')
 or coalesce(der.level_3,'UNSPECIFIED') in ('Robert Tobin','Bobby Mukundan')
 or coalesce(der.level_2,'UNSPECIFIED') in ('Robert Tobin','Bobby Mukundan')
 or coalesce(der.department_head,'UNSPECIFIED') in ('Robert Tobin','Bobby Mukundan') then 'Infrastructure'
 else 'Application' END)  and  row_key>0 )der
 
 