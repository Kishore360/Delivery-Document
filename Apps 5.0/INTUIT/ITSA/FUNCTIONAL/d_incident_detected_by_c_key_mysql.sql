SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for d_incident.detected_by_c_key' 
         ELSE 'SUCCESS' 
       END AS Message 
from intuit_mdsdb.incident_final a
left join intuit_mdwdb.d_lov c on COALESCE(CONCAT('DETECTED_BY~INCIDENT','~','','~','','~',a.u_detected_by),'UNSPECIFIED')=c.row_id
join 
 intuit_mdwdb.d_incident b on b.row_id=a.sys_id and b.source_id=a.sourceinstance
where coalesce(c.row_key,case when a.u_detected_by is null then 0 else -1 end )<>b.detected_by_c_key