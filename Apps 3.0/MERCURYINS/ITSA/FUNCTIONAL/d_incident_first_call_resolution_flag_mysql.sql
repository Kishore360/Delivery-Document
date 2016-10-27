SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.assignment_group_key' ELSE 'SUCCESS' END as Message
  FROM  
mercuryins_mdsdb.incident_final a left  join
mercuryins_mdwdb.d_incident TRGT on a.sys_id=TRGT.row_id and a.sourceinstance=TRGT.source_id
 where case when a.u_fcr=1 then 'Y' else 'N' end  <> (TRGT.first_call_resolution_flag ) 