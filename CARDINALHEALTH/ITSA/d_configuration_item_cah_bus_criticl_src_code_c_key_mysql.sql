SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_configuration_item a
join cardinalhealth_mdsdb.cmdb_ci_application_final b
on a.row_id=b.sys_id and a.source_id=b.sourceinstance
left join cardinalhealth_mdwdb.d_lov c
on c.row_id=CASE WHEN b.u_cah_business_criticality IS NULL THEN 'UNSPECIFIED' ELSE UPPER(CONCAT('U_CAH_BUSINESS_CRITICALITY~CMDB_CI_APPLICATION','~','','~','','~',COALESCE(b.u_cah_business_criticality,''))) END and 
c.source_id = CASE WHEN b.u_cah_business_criticality IS NULL THEN 0 ELSE b.sourceinstance END
<<<<<<< HEAD
where a.cah_bus_criticl_src_code_c_key<>(c.row_key);
=======
where a.cah_bus_criticl_src_code_c_key<>coalesce(c.row_key,'');
>>>>>>> b24a4dfda5506de5959fa3ef85cf0d2c8e75a5ef
