SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

from(select  count(1) as cnt

from pgi_mdwdb.f_incident ds

JOIN pgi_mdsdb.incident_final inc

on ds.row_id=inc.sys_id and 

ds.source_id=inc.sourceinstance

where ds.OPEN_TO_CLOSE_DURATION<>TIMESTAMPDIFF(SECOND,inc.sys_created_on,inc.closed_at) )a ;
