
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.tpid_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) cnt  from
  
(
select a.number,
coalesce(c.name  ,'UNSPECIFIED') as assignment_group_company,assignment_group_company_c,u_require_downtime,downtime_required_c,
f.ci_class,b1.label, a1.category,ci_category_c  from
 png_mdsdb.change_request_final a
left join
png_mdsdb.sys_user_group_final b
on a.assignment_group = b.sys_id and a.sourceinstance=b.sourceinstance
left join
png_mdsdb.core_company_final c
on b.u_company = c.sys_id and b.sourceinstance=c.sourceinstance 
join png_mdsdb.cmdb_ci_final a1 on a.cmdb_ci=a1.sys_id and a.sourceinstance=a1.sourceinstance
left join png_mdsdb.sys_db_object_final b1
on a1.sys_class_name=b1.name and a1.sourceinstance=b1.sourceinstance
join png_mdwdb.d_change_request d on a.sys_id=d.row_id and a.sourceinstance=d.source_id
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key and f.current_flag='Y')a
where assignment_group_company<>assignment_group_company_c and u_require_downtime<>downtime_required_c  and a.ci_class<>a.label and a.category<>ci_category_c)b;


