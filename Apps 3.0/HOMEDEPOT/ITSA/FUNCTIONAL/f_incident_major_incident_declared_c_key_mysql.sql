SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.incident_final a
 left  JOIN   homedepot_mdwdb.f_incident b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
LEFT JOIN homedepot_mdwdb.d_calendar_date LKP
on LKP.row_id = DATE_FORMAT(CONVERT_TZ(a.u_major_incident_declared,'GMT','America/New_York'),'%Y%m%d')
WHERE COALESCE(LKP.row_key,CASE WHEN a.u_major_incident_declared IS NULL THEN 0 else -1 end)<> (b.major_incident_declared_c_key))a;