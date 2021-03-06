

SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from
svb_mdsdb.incident_final a
left outer join svb_mdwdb.d_incident b on
a. u_resolved_by=b.row_id
left join svb_mdwdb. f_incident c 
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
where b.row_key<>c.  last_resolved_by_key)c