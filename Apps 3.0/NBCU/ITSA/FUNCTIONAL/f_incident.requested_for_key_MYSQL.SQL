SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt
from  nbcu_mdsdb.incident_final src
join nbcu_mdwdb.f_incident trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
LEFT JOIN nbcu_mdwdb.d_internal_contact lkp
 ON ( coalesce(concat('INTERNAL_CONTACT~',src.u_requested_for ),'UNSPECIFIED')= lkp.row_id 
AND src.sourceinstance= lkp.source_id )
 WHERE COALESCE(lkp.row_key,CASE WHEN src.u_requested_for IS NULL THEN 0 else -1 end)<>trgt.requested_for_key
 and trgt.soft_deleted_flag='N')a