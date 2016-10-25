SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from pgi_mdsdb.u_external_incident_final b
    JOIN  pgi_mdwdb.d_incident a
ON (a.row_id=b.sys_id AND a.source_id=b.sourceinstance)
where a.flagged_for_review_time_c <> CONVERT_TZ(b.u_flagged_for_review_time,'GMT','UTC')) c