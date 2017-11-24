
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from  watson_mdsdb.change_request_final b
join watson_mdwdb.d_internal_contact a 
on b.u_service_owner = right(a.row_id,32)
join watson_mdwdb.d_change_request c
on b.sys_id =c.row_id and c.source_id=b.sourceinstance
where coalesce(a.row_key,case when b.u_service_owner is null then 0 else -1 end)  <> c.service_owner_c_key


