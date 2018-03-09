
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.u_privileged_access_management_c' ELSE 'SUCCESS' END as Message
 FROM fidelity_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN fidelity_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
  WHERE CASE WHEN SRC.u_privileged_access_management = 1 then 'Y' else 'N' end <> TRGT.u_privileged_access_management_c
