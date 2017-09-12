 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_work_order.first_call_resolution_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM schneider_mdwdb.f_work_order f 
 JOIN schneider_mdwdb. d_work_order a ON a.row_key = f.work_order_key AND f.source_id = a.source_id 
 JOIN schneider_mdwdb.d_lov_map br ON  a.work_order_state_key  = br.src_key AND br.dimension_wh_code in ('CLOSED', 'RESOLVED')
 AND br.dimension_class = 'STATE~WORK_ORDER'
WHERE (case when TIMESTAMPDIFF(MINUTE, a.opened_on, a.closed_on) < 30 then 'Y' else 'N' end)  <> a.first_call_resolution_flag )a;
 
 