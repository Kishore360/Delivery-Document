SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.incident_final SRC
  JOIN usf_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id ) 
 WHERE( CASE WHEN SRC.u_closure_code='Quick Close' THEN 'Y' ELSE 'N' END )  <> TRGT.first_call_resolution_flag
 