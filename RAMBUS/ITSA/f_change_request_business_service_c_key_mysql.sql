SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message
 
from(
select count(1) as cnt 

from rambus_mdsdb.problem_final a 

inner join rambus_mdwdb.f_change_request c 

on a.sys_id = c.row_id 
and 
a.sourceinstance = c.source_id

left outer join rambus_mdwdb.d_configuration_item b

on b.row_id=a.u_business_service

where c.business_service_c_key<>coalesce(b.row_key,-1)) z;