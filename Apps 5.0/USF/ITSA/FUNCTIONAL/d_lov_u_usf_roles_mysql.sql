SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  usf_mdsdb.u_usf_roles_final s
left  JOIN usf_mdwdb.d_lov t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  
WHERE 'ROLE_C~INTERNAL_CONTACT'<>
 t.dimension_class
) temp