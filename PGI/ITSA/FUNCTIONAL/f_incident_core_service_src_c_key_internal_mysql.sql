SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
pgi_mdwdb.f_incident finc 
join
pgi_mdsdb.u_internal_incident_final inc
ON finc.row_id = inc.sys_id and finc.source_id=inc.sourceinstance
join
pgi_mdsdb.u_pgi_product_list_final inc1
on inc.u_product_s__affected=inc1.sys_id
JOIN pgi_mdwdb.d_lov lkp 
ON COALESCE(CONCAT('CORE_SERVICE~INCIDENT~~~',inc1.u_core_service),'UNSPECIFIED')  = lkp.row_id
 and finc.source_id=lkp.source_id
where coalesce(lkp.row_key,case when inc1.u_core_service is null then 0 else -1 end)<> finc.core_service_src_c_key)a

