
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from gilead_mdsdb.incident_final a
left join gilead_mdwdb.d_configuration_item c on a.u_business_service=c.row_id and  a.sourceinstance=c.source_id
left join gilead_mdwdb.f_incident b on a.sourceinstance=b.source_id and a.sys_id=b.row_id
WHERE c.row_key<>b.business_service_c_key  

)i; 