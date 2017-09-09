 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_work_order.age' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM schneider_mdwdb.f_work_order f 
 JOIN schneider_mdwdb. d_work_order a ON a.row_key = f.work_order_key AND f.source_id = a.source_id 
 JOIN schneider_mdwdb.d_lov_map br ON  a.work_order_state_key  = br.src_key AND br.dimension_wh_code = 'OPEN'
 JOIN (select max(lastupdated) as lastupdated,source_id from schneider_workdb.d_o_data_freshness group by source_id) df ON f.source_id = df.source_id
WHERE TIMESTAMPDIFF(second,CONVERT_TZ(a.opened_on,'America/Los_Angeles','GMT'), CONVERT_TZ(df.lastupdated,'America/Los_Angeles','GMT')) <> f.age) a;
 
 