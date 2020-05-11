
SELECT  
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident_ext_c.itot_opened_on_c' ELSE 'SUCCESS' END as Message 
FROM 
( 
SELECT Count(1) as CNT 
from png_mdsdb.incident_final a 
LEFT JOIN png_mdsdb.incident_final b ON a.parent_incident = b.sys_id and a.sourceinstance = b.sourceinstance
LEFT JOIN png_mdwdb.d_incident_ext_c c ON a.sys_id = c.row_id and a.sourceinstance = c.source_id 
 where  
CONVERT_TZ(CASE WHEN a.parent_incident is NOT NULL THEN b.opened_at  ELSE a.opened_at END ,'GMT', 'America/New_York')<>itot_opened_on_c and a.cdctype ='X'
) temp;




 