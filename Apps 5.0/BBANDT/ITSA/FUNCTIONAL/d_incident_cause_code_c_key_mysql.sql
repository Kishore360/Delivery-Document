SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from bbandt_mdsdb.incident_final a
JOIN bbandt_mdwdb.d_incident b
on a.sys_id= b.row_id and a.sourceinstance=b.source_id
LEFT JOIN bbandt_mdwdb.d_lov LKP 
 ON ( u_cause_code= LKP.row_id 
AND a.sourceinstance= LKP.source_id )
WHERE dimension_class='CAUSE_CODE_C~INCIDENT' and COALESCE(LKP.row_key,CASE WHEN a.u_cause_code IS NULL THEN 0 else -1 end)<>b.cause_code_c_key)temp; 