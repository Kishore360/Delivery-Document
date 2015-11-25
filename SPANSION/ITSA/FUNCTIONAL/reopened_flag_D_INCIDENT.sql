SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt
from spansion_mdsdb.incident_final a inner join spansion_workdb.dwh_d_incident b 
on a.sys_id collate utf8_unicode_ci= b.row_id 
where reopened_flag <>case when u_reopened='1' then 'Y' else 'N' end )c
