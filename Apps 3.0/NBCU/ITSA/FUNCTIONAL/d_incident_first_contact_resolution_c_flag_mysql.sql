SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
from
nbcu_mdsdb.incident_final a
join nbcu_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
JOIN nbcu_mdwdb.d_lov_map dlm ON b.state_src_key = dlm.src_key  
where (case when a.reopen_count=0 and a.reassignment_count=0
AND TIMESTAMPDIFF(HOUR,a.opened_at,COALESCE(a.resolved_at,a.closed_at,'2099-01-01 00:00:00'))<=24
 then 'Y' else 'N' end)<>b.first_contact_resolution_c_flag AND dlm.dimension_class = 'STATE~INCIDENT'
  AND dlm.dimension_wh_code ='CLOSED';