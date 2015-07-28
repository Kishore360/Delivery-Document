SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.cmdb_ci_application_delta a
left join d_configuration_item b
on a.sys_id=b.row_id and b.source_id=a.sourceinstance
where b.cah_bus_unit_src_code_c<>a.u_business_unit;
