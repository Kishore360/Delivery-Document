

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_asc_c.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM mercuryins_mdsdb.u_asc_ticket_final SRC 
 LEFT JOIN mercuryins_mdwdb.d_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.reassignment_count >= 1 then 'Y' else 'N' END)<> (TRGT.multiple_assignment_flag )
