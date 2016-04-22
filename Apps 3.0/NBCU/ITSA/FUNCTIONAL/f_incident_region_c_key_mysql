SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdwdb.f_incident a11
left join nbcu_mdsdb.incident_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
join nbcu_mdwdb.d_lov a13
on COALESCE(CONCAT('REGION_C~INCIDENT~~~',UPPER(a12.u_region )),'UNSPECIFIED')=a13.row_id
where COALESCE(a13.row_key,CASE WHEN a12.u_region IS NULL THEN 0 else -1 end) <>a11.region_c_key)a
