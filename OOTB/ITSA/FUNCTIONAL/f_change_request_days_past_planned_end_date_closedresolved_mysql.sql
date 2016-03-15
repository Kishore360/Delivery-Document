--This query will pass only in APPS 3.0 version since this was fixed as part of defect 1984 APPS JIRA
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.closed_by_key' ELSE 'SUCCESS' END as Message
  FROM 
(select * from <<tenant>>_mdsdb.change_request_final where opened_at < closed_at) SRC 
  join <<tenant>>_mdwdb.f_change_request f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN <<tenant>>_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code in ('CLOSED') and br.dimension_class = 'STATE~CHANGE_REQUEST'
JOIN <<tenant>>_mdwdb.d_change_request a ON a.row_key = f.change_request_key
AND f.source_id = a.source_id 

WHERE  case when COALESCE(a.work_end_on,a.closed_on)>a.planned_end_on then
 timestampdiff(day, a.planned_end_on,COALESCE(a.work_end_on,a.closed_on)) else NULL end<> f.days_past_planned_end_date
 