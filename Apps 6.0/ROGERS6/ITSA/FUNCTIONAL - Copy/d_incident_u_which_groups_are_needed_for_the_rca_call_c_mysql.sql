SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.groups_for_rca_c' ELSE 'SUCCESS' END as Message FROM rogers_mdsdb.incident_final  SRC JOIN rogers_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.u_which_groups_are_needed_for_the_rca_call <> (TRGT.u_which_groups_are_needed_for_the_rca_call_c) 
and SRC.CDCTYPE='X' 
