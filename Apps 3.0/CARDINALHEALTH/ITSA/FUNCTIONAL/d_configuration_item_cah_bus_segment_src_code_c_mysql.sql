SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdsdb.cmdb_ci_application_final a
left join cardinalhealth_mdwdb.d_configuration_item b
on a.sys_id=b.row_id and b.source_id=a.sourceinstance
where b.cah_bus_segment_src_code_c <>a.u_cah_business_segment)temp;

