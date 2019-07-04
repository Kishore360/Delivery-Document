SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1)  cnt from
meritsa_mdsdb.incident_final a join
 meritsa_mdwdb.d_incident b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id and a.cdctype='X'
where  
case when a.u_created_by_wess=1 then 'Y' else 'N' END  <> b.created_by_wess_c)b