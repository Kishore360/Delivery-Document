SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
jnj_mdsdb.incident_final x  left join 
jnj_mdwdb.d_internal_organization y on 
CONCAT('GROUP~',x.u_resolved_by_group)=row_id  AND sourceinstance= source_id 
 JOIN   jnj_mdwdb.f_incident B on x.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE  B.resolved_by_group_key <> CASE WHEN x.u_resolved_by_group is null then 0 
WHEN (x.u_resolved_by_group is not null and B.pivot_date is null) then -1 else y.row_key end)E; 

