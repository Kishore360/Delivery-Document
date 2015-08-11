SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from homedepot_mdsdb.incident_final a
left join homedepot_mdwdb.d_internal_contact c
on concat('INTERNAL_CONTACT~',a.closed_by) = c.row_id
and a.sourceinstance=c.source_id
inner JOIN  homedepot_mdwdb.f_incident b
on  a.sys_id = b.row_id and a. sourceinstance =b.source_id
where b.last_resolved_by_key <> case when a.closed_by is null then 0 else coalesce(c.row_key,-1) end ) x