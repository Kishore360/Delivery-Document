
SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from svb_mdsdb.incident_final a
left outer join uclahealth_mdwdb.d_incident b on
a. u_parent_incident=b.row_id
left join svb_mdwdb. f_incident c 
on b.row_id=c.row_id and b.source_id=c.source_id
where b.row_key<>c. parent_incident_key)c
