SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_walk_up_c.last_resolved_by_key' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from  paloalto_mdsdb.u_walk_up_final  src 
left join paloalto_mdwdb.f_walk_up_c trgt  ON src.sys_id=trgt.row_id  and src.sourceinstance=trgt.source_id
left join paloalto_mdwdb.d_internal_contact LKP ON concat('INTERNAL_CONTACT~',src.u_resolved_by)  = LKP.row_id
where COALESCE(LKP.row_key, case when src.u_resolved_by is null then 0 else -1 end) <> trgt.last_resolved_by_key) temp;