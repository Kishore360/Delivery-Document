SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from mcdonalds_mdsdb.sys_user_final src
join mcdonalds_mdwdb.d_internal_contact trgt on src.sys_id=trgt.row_id and  src.sourceinstance=trgt.source_id 
where src.u_vendor_name <>trgt.vendor_name_c


