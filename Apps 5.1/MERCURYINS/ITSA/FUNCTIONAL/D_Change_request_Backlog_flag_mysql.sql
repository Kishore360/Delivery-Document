SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary_aux_dept_loc_cc' ELSE 'SUCCESS' END as Message
from  mercuryins_mdwdb.d_change_request d
JOIN mercuryins_mdwdb.f_change_request f
on d.row_key = f.change_request_key  
JOIN mercuryins_mdwdb.d_lov_map lov_map
on f.state_src_key = lov_map.src_key   and  lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
where  d.backlog_flag<>case when lov_map.dimension_wh_code NOT IN('RESOLVED','CLOSED') then  'Y' else 'N'  end