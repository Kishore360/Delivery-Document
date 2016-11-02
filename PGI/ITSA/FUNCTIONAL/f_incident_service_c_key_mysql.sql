SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
pgi_mdwdb.f_incident finc 
join
pgi_mdsdb.u_external_incident_final inc
ON finc.row_id = inc.sys_id and finc.source_id=inc.sourceinstance
JOIN pgi_mdwdb.d_lov lkp 
ON COALESCE(CONCAT('SERVICE_LEVEL~INCIDENT~~~',inc.u_service_level),'UNSPECIFIED') = lkp.row_id
 -- and finc.source_id=lkp.source_id
where coalesce(lkp.row_key,case when inc.u_service_level  is null then 0 else -1 end)<> finc.service_c_key)a
