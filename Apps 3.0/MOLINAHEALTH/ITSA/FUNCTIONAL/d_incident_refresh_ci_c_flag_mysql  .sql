SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.incident_final SRC1 left join
molinahealth_mdsdb.u_major_incident_final SRC on SRC1.parent =SRC.sys_id and SRC.sourceinstance=SRC1.sourceinstance
 LEFT JOIN molinahealth_mdwdb.d_incident TRGT 
 ON (SRC1.sys_id =TRGT.row_id  
 AND SRC1.sourceinstance= TRGT.source_id  )
 WHERE case when SRC.u_refresh_ci=1 then 'Y' else 'N' end<> refresh_ci_c_flag



