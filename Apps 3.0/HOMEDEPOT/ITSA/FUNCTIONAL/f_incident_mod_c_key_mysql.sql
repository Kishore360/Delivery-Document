SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt  from homedepot_mdsdb.incident_final b
left join homedepot_mdwdb.d_internal_contact a
on a.row_id=concat('INTERNAL_CONTACT~',b.u_mod) and b.sourceinstance=a.source_id
left join  homedepot_mdwdb.f_incident c
on  c.row_id=b.sys_id  and b.sourceinstance=c.source_id
WHERE COALESCE(a.row_key,CASE WHEN b.u_mod IS NULL THEN 0 else -1 end)<>c.mod_c_key) temp;