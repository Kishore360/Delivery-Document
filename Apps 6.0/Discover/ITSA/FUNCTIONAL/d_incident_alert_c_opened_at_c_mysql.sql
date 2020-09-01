SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_alert_c.opened_at_c' ELSE 'SUCCESS' END as Message 
from discover_mdsdb.incident_alert_final src
inner join discover_mdwdb.d_incident_alert_c dim
on src.sys_id=dim.row_id and src.sourceinstance=dim.source_id
where CONVERT_TZ(src.opened_at,'GMT','America/New_York')<>dim.opened_at_c;