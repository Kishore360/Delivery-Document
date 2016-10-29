SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from pgi_mdsdb.incident_final b
    JOIN  pgi_mdwdb.d_incident a
ON (a.row_id=b.sys_id AND a.source_id=b.sourceinstance)
where CASE WHEN b.u_poor_ticket_quality IS NULL THEN 'N' ELSE 'Y' END <> a.poor_ticket_quality_c_flag ) c