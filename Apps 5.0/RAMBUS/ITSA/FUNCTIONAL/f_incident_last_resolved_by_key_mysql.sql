SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT AA.last_resolved_by_key , d.row_key
from rambus_mdwdb.f_incident AA 
INNER JOIN rambus_mdsdb.incident_final BB ON AA.row_id=BB.sys_id AND AA.source_id=BB.sourceinstance 
 JOIN rambus_mdwdb.d_lov_map c ON c.dimension_class ='STATE~INCIDENT' AND BB.sourceinstance=c.source_id AND c.dimension_code = BB.state  AND dimension_wh_code IN ('CLOSED','RESOLVED')
 JOIN rambus_mdwdb.d_internal_contact d ON d.row_id =  concat('INTERNAL_CONTACT~',BB.resolved_by)
where AA.last_resolved_by_key <> d.row_key 
UNION ALL
SELECT AA.last_resolved_by_key , 0
from rambus_mdwdb.f_incident AA 
INNER JOIN rambus_mdsdb.incident_final BB ON AA.row_id=BB.sys_id AND AA.source_id=BB.sourceinstance 
 JOIN rambus_mdwdb.d_lov_map c ON c.dimension_class ='STATE~INCIDENT' AND BB.sourceinstance=c.source_id AND c.dimension_code = BB.state  AND dimension_wh_code ='OPEN'
 JOIN rambus_mdwdb.d_internal_contact d ON d.row_id =  concat('INTERNAL_CONTACT~',BB.resolved_by)
where AA.last_resolved_by_key <> 0) a;