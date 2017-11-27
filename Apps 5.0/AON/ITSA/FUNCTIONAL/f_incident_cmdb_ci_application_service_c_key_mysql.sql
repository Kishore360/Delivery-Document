 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.cmdb_ci_application_service_c_key' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt from aon_mdsdb.incident_final SRC
 LEFT JOIN aon_mdsdb.u_cmdb_ci_application_service_final SRC1 
 ON (SRC.cmdb_ci =SRC1.sys_id  
 AND SRC.sourceinstance= SRC1.sourceinstance  )
 LEFT JOIN aon_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aon_mdwdb.d_cmdb_ci_application_service_c LKP
 ON TRGT.cmdb_ci_application_service_c_key = LKP.row_key  
 join aon_mdsdb.u_business_unit_lookup_final bu1
on SRC1.u_business_unit=bu1.sys_id and bu1.sourceinstance= SRC1.sourceinstance
join aon_mdsdb.u_business_unit_sub_lookup_final bu2 --check this part for subdivision
on SRC1.u_business_unit_subdivision=bu2.sys_id and bu2.sourceinstance= SRC1.sourceinstance
  join aon_mdsdb.u_business_unit_lookup_final bu3
on bu2.u_bu=bu3.sys_id and bu2.sourceinstance= bu3.sourceinstance
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_business_unit  IS NULL THEN 0 else -1 end)<> (TRGT.cmdb_ci_application_service_c_key))b;
 
 
 