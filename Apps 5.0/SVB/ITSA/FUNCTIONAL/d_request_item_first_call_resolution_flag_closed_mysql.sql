 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_request_item d
JOIN svb_mdwdb.f_request_item f ON d.row_key = f.request_item_key
JOIN svb_mdwdb.d_lov_map lov_map ON f.state_src_key = lov_map.src_key
and lov_map.dimension_class = 'STATE~SC_REQ_ITEM' AND lov_map.dimension_wh_code in ('CLOSED', 'RESOLVED')
where case when TIMESTAMPDIFF(MINUTE,d.opened_on,d.closed_on)<30 then 'Y' else 'N' END <>d.first_call_resolution_flag
 )c
