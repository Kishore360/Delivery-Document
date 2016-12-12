
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.f_incident a
JOIN nbcu_mdsdb.incident_final b ON a.row_id=b.sys_id AND a.source_id = b.sourceinstance
JOIN nbcu_mdsdb.sys_user_group_final c
 on b.u_resolver_group =c.sys_id and b.sourceinstance=c.sourceinstance
join nbcu_mdwdb.d_internal_organization d
on COALESCE(concat('GROUP~',b.u_resolver_group),'UNSPECIFIED')= d.row_id
where coalesce(d.row_key,case when b.u_resolver_group is null then 0 else -1 end)<>a.resolver_group_c_key