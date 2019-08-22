SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application.subject_to_pci_testing_c' ELSE 'SUCCESS' END as Message 
FROM rogers_mdsdb.cmdb_ci_appl_final  SRC 
JOIN rogers_mdwdb.d_application TRGT 
ON (concat('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
where component_criticality_c <> COALESCE(u_component_criticality,'UNSPECIFIED')
and SRC.CDCTYPE='X';