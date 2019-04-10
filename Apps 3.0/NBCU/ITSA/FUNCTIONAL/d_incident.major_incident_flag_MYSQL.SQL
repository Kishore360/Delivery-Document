SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt
from  nbcu_mdsdb.incident_final src
join nbcu_mdwdb.d_incident trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where case when (src.u_major_incident  = 1) then 'Y' else 'N' end <>trgt.major_incident_flag and trgt.soft_deleted_flag='N')ma
