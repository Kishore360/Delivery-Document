
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

from(

select count(1) as cnt 
from 
(select sys_id,sourceinstance,u_business_service from rambus_mdsdb.incident_final

union all

select sys_id,sourceinstance,u_business_service from rambus_mdsdb.u_ad_hoc_request_final) a
 
inner join rambus_mdwdb.f_incident c on a.sys_id = c.row_id 
and a.sourceinstance = c.source_id

left outer join rambus_mdwdb.d_configuration_item b

on b.row_id=coalesce(a.u_business_service,'UNSPECIFIED')

and b.source_id=case when a.u_business_service is null then b.source_id else a.sourceinstance end

where  c.business_service_c_key<>coalesce(b.row_key)) z;