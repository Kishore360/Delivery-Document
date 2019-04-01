SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tjx_mdsdb.incident_final src
left join tjx_mdwdb.d_internal_contact lkp
on coalesce(CONCAT('INTERNAL_CONTACT~',src.u_mi_primary_owner),'UNSPECIFIED')=lkp.row_id and src.sourceinstance=lkp.source_id
 join  tjx_mdwdb.f_incident trgt
on  src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.u_mi_primary_owner IS NULL THEN 0 else -1 end)<>trgt.mi_primary_owner_c_key) temp;

