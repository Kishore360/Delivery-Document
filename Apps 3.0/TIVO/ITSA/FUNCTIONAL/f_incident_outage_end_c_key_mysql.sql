SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from tivo_mdsdb.incident_final a11
left join tivo_mdwdb.f_incident a12
on a11.sys_id=a12.row_id and a11.sourceinstance=a12.source_id
left join tivo_mdwdb.d_calendar_date a13
on COALESCE(DATE_FORMAT(CONVERT_TZ(a11.u_outage_end,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') 
= a13.row_id
where coalesce(a13.row_key,-99)<>coalesce(a12.outage_end_c_key,-99) )a
