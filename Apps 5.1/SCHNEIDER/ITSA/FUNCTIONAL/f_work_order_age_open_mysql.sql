 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_work_order.age' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM (select task_id,sourceinstance,SUBMIT_DATE from schneider_mdsdb.WOI_WORKORDER_final where SUBMIT_DATE < coalesce(resolved_at,SUBMIT_DATE)) SRC 
  join schneider_mdwdb.f_work_order f ON (SRC.task_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN schneider_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~WORKORDER'

WHERE TIMESTAMPDIFF(DAY,SRC.SUBMIT_DATE,(SELECT CONVERT_TZ(max(lastupdated),'America/Los_Angeles','GMT') AS lastupdated FROM schneider_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=f.etl_run_number))<> f.age

 )A
 
 