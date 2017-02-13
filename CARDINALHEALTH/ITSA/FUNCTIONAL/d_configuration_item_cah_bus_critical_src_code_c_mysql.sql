SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM
cardinalhealth_mdsdb.cmdb_ci_application_final ccaf
left join cardinalhealth_mdwdb.d_configuration_item d
 ON d.row_id = ccaf.sys_id
	AND d.source_id=ccaf.sourceinstance
where d.cah_bus_criticl_src_code_c <>ccaf.u_cah_business_criticality