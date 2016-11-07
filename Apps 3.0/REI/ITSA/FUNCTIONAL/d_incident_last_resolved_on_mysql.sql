SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.d_incident AA 
INNER JOIN 
rei_mdsdb.incident_final BB 
ON AA.row_id =BB.sys_id AND AA.source_id=BB.sourceinstance 
LEFT JOIN 
rei_mdwdb.d_lov_map c  
on (c.dimension_class ='STATE~INCIDENT' 
AND BB.sourceinstance=c.source_id 
AND c.dimension_code = BB.state )
where CONVERT_TZ(CASE WHEN c.dimension_wh_code IN('RESOLVED','CLOSED') 
AND BB.u_last_resolution_date IS NULL THEN sys_updated_on 
ELSE BB.u_last_resolution_date END, 'GMT','America/Los_Angeles')<>AA.last_resolved_on)a