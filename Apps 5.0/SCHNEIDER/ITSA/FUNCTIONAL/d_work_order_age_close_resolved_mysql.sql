
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_work_order.age' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
from
 (select sys_updated_on,work_order_id,sourceinstance,SUBMIT_DATE,resolved_at,completed_date 
from schneider_mdsdb.woi_workorder_final where SUBMIT_DATE < coalesce(resolved_at,completed_date)) SRC 
  join schneider_mdwdb.d_work_order f ON (SRC.work_order_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN schneider_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')

WHERE
timestampdiff(Day, convert_tz(convert_tz(SRC.SUBMIT_DATE,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'), 
coalesce(convert_tz(convert_tz(SRC.resolved_at,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'), 
convert_tz(convert_tz(SRC.completed_date,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'),
convert_tz(convert_tz(SRC.sys_updated_on,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'))) <> f.age
  )a
  
  
  
  
  
  
  
  