

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
ibmwatson_mdsdb.sn_customerservice_case_final a
join ibmwatson_mdwdb.f_case b 
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.sys_mod_count<>b.update_count_c;