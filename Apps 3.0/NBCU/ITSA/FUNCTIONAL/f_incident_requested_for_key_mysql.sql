SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt
from  nbcu_mdwdb.f_incident a11
left join nbcu_mdsdb.incident_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
LEFT JOIN nbcu_mdwdb.d_internal_contact a13 
 ON ( coalesce(concat('INTERNAL_CONTACT~',u_requested_for ),'UNSPECIFIED')= a13.row_id 
AND a12.sourceinstance= a13.source_id )
 WHERE COALESCE(a13.row_key,CASE WHEN a12.u_requested_for IS NULL THEN 0 else -1 end)<>(a11.requested_for_key))a