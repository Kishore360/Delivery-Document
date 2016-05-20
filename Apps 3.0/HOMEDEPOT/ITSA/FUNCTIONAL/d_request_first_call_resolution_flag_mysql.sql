SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request_item.first_call_resolution_flag' ELSE 'SUCCESS' END as Message FROM(
select count(1) cnt from homedepot_mdwdb.d_request d
JOIN homedepot_mdwdb.f_request f ON d.row_key = f.request_key
JOIN homedepot_mdwdb.d_lov_map lov_map ON f.state_src_key = lov_map.src_key
where
case when lov_map.dimension_class = 'REQUEST_STATE~SC_REQUEST' and lov_map.dimension_wh_code ='CLOSED' 
 AND TIMESTAMPDIFF(MINUTE,d.opened_on,d.closed_on)<30 then 'Y' else 'N' end <>d.first_call_resolution_flag)x