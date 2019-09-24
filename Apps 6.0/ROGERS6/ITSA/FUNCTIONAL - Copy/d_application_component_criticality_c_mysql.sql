SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_application.component_criticality_c' ELSE 'SUCCESS' END as Message
-- select distinct COALESCE(SRC.u_component_criticality,'UNSPECIFIED'),TRGT.component_criticality_c,SRC.cdctype
 FROM rogers_mdsdb.cmdb_ci_appl_final  SRC  
JOIN rogers_mdwdb.d_application TRGT 
ON (concat('APPLICATION~',SRC.sys_id) = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE  COALESCE(SRC.u_component_criticality,'UNSPECIFIED')<>TRGT.component_criticality_c
and SRC.CDCTYPE='X';