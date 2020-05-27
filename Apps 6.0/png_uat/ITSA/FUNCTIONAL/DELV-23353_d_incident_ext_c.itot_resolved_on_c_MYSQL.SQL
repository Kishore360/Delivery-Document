
SELECT  
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident_ext_c.itot_resolved_on_c' ELSE 'SUCCESS' END as Message
FROM 
(  
SELECT Count(1) as CNT 
from png_mdsdb.incident_final a 
LEFT JOIN png_mdsdb.incident_final b ON a.parent_incident = b.sys_id and a.sourceinstance = b.sourceinstance
LEFT JOIN png_mdwdb.d_incident_ext_c c ON a.sys_id = c.row_id and a.sourceinstance = c.source_id 
WHERE  
CONVERT_TZ(CASE WHEN a.parent_incident is NOT NULL THEN  coalesce(b.resolved_at,b.closed_at,b.sys_updated_on )   
ELSE coalesce(a.resolved_at,a.closed_at,a.sys_updated_on) <> itot_resolved_on_c and a.cdctype ='X'
and  a.state in(6,7)
) temp;


