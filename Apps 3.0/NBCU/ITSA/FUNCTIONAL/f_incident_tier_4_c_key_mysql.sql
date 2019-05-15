SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdsdb.incident_final a12
left join nbcu_mdwdb.f_incident a11
on a12.sys_id=a11.row_id and a12.sourceinstance=a11.source_id
join nbcu_mdwdb.d_lov a13
on COALESCE(CONCAT('TIER_4_C~INCIDENT~~~',UPPER(a12.u_tier_4)),'UNSPECIFIED')=a13.row_id
and a12.sourceinstance=a13.source_id
where COALESCE(a13.row_key,CASE WHEN a12.u_tier_4 IS NULL THEN 0 else -1 end) <>a11.tier_4_c_key
and a13.soft_deleted_flag='N')a