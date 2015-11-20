SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from ucsf_mdsdb.change_request_final a
LEFT JOIN ucsf_mdwdb.f_change_request b on a.sys_id=b.row_id and a.sourceinstance=b.source_id
LEFT JOIN ucsf_mdwdb.d_lov_map br ON b.state_src_key = br.src_key 
where b.actual_duration<> case when br.dimension_wh_code = 'OPEN' then 0 else  
coalesce(timestampdiff(second,'1970-01-01 00:00:00',a.u_duration),0) end ;