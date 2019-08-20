SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
     rogers_mdwdb.f_incident d 
JOIN rogers_mdsdb.incident_final p ON d.row_id=p.sys_id and p.sourceinstance=d.source_id
left join rogers_mdwdb.d_internal_organization d1 on case                   
                when p.priority in (1,
                2) then coalesce( concat('GROUP~',
                p.u_resolver_group),
                'UNSPECIFIED')      
                else       concat('GROUP~',
                p.assignment_group)              
            end =d1.row_id and p.sourceinstance=d1.source_id 
where coalesce(d1.row_key,case when u_resolver_group is null then 0 else -1 end ) <> business_unit_assignment_group_c_key  )a



