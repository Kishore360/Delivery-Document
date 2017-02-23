SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT 
from
cardinalhealth_mdwdb.d_change_request d
JOIN cardinalhealth_mdsdb.change_request_final i 
on d.row_id = i.sys_id and d.source_id= i.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.u_apm_businessunit_final r
 on i.u_business_unit=r.sys_id and i.sourceinstance=r.sourceinstance
where r.u_name<>d.business_unit_c)temp;
