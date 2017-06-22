SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt


from rambus_mdwdb.f_incident AA 


INNER JOIN rambus_mdsdb.incident_final BB 
ON AA.row_id=BB.sys_id
AND AA.source_id=BB.sourceinstance 


INNER JOIN rambus_mdwdb.d_lov_map c
 ON c.dimension_class ='STATE~INCIDENT'
 AND BB.sourceinstance=c.source_id 
 AND c.dimension_code = BB.state 
AND c.dimension_wh_code IN('RESOLVED','CLOSED')


LEFT JOIN rambus_mdwdb.d_calendar_date d 
ON d.row_id =  
DATE_FORMAT (CONVERT_TZ (COALESCE(BB.closed_at,sys_updated_on),'GMT','America/Los_Angeles'),'%Y%m%d')

where AA.closed_on_key <> COALESCE(d.row_key,coalesce(AA.last_resolved_on_key,c.row_key))) a;
