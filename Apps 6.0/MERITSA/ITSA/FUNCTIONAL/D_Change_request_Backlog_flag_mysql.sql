SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.backlog_flag' ELSE 'SUCCESS' END as Message
from  meritsa_mdsdb.change_request_final src
JOIN meritsa_mdwdb.f_change_request f
on src.sys_id = f.row_id  and src.sourceinstance=f.source_id
JOIN meritsa_mdwdb.d_change_request d
on src.sys_id = d.row_id and src.sourceinstance=d.source_id
JOIN meritsa_mdwdb.d_lov_map lov_map
on f.state_src_key = lov_map.src_key   and  lov_map.dimension_class = 'STATE~CHANGE_REQUEST'  
and lov_map.dimension_wh_code not IN ('CANCELED')  
where  d.backlog_flag<>case when lov_map.dimension_wh_code not IN ('RESOLVED','CLOSED') then 'Y' else 'N'  end