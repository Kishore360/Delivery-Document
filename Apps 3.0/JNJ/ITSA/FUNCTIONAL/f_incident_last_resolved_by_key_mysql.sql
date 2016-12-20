SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
jnj_mdsdb.incident_final x  
join jnj_mdwdb.f_incident B on x.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
left join 
jnj_mdwdb.d_internal_contact y on 
CONCAT('INTERNAL_CONTACT~',x.u_resolved_by)=y.row_id  AND sourceinstance= y.source_id  and DATE_FORMAT(B.pivot_date, '%Y-%m-%d %H:%i:%s') 
BETWEEN effective_from AND effective_to
WHERE  B.last_resolved_by_key<>CASE WHEN x.u_resolved_by is null then 0 
WHEN (x.u_resolved_by is not null and B.pivot_date is null) then -1 else y.row_key end)E;  
