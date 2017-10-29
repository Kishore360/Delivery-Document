SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdwdb.d_configuration_item a
join cardinalhealth_mdsdb.cmdb_ci_application_final b
on a.row_id=b.sys_id and a.source_id=b.sourceinstance
left join cardinalhealth_mdwdb.d_lov c
on c.row_id = CASE WHEN b.u_business_unit IS NULL THEN 'UNSPECIFIED' ELSE UPPER(CONCAT('U_CAH_BUSINESS_UNIT~CMDB_CI_APPLICATION','~','','~','','~',COALESCE(b.u_business_unit,''))) END 
AND 
c.source_id = CASE WHEN b.u_business_unit IS NULL THEN 0 ELSE b.sourceinstance END
where a.cah_bus_unit_src_code_c_key<>(c.row_key))temp;

