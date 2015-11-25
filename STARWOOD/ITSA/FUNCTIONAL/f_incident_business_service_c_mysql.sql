
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result

,CASE WHEN cnt > 0 THEN 'Data did not Match.' 

ELSE 'Data Matched' END AS Message 

FROM (

select count(1) as cnt  

from starwood_mdsdb.incident_final a

left join starwood_mdsdb.incident_classification_final c 
on a.sys_id=c.sys_id

left join starwood_mdwdb.d_configuration_item d 
on c.u_business_service=d.row_id and a.sourceinstance=d.source_id

left JOIN  starwood_mdwdb.f_incident b 
on d.row_id=b.row_id

where  b.business_service_c_key <> d.row_key)b 