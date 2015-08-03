
SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (select count(1) as cnt  from (

select b.row_key,c. parent_incident_key
 from 
svb_mdsdb.incident_final a
left join svb_mdwdb. f_incident c 
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
left outer join svb_mdwdb.d_incident b on
a. u_parent_incident=b.row_id and a.sourceinstance=b.source_id)h
where row_key<> parent_incident_key)C

