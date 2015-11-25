 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from usf_mdwdb.d_incident fi JOIN
usf_mdsdb.incident_final
f ON (fi.row_id =f.sys_id AND fi.source_id=f.sourceinstance)
where fi.incident_type <> f.u_type)c;
 