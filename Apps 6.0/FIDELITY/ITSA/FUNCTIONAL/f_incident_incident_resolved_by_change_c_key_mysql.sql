SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.incident_final  SRC 
JOIN fidelity_mdwdb.f_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join  fidelity_mdwdb.d_change_request LKP
on  case  when SRC.u_resolved_by_change is null then 'UNSPECIFIED'  else LEFT(SRC.u_resolved_by_change, 32)  end= LKP.row_id and SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key, case when SRC.u_resolved_by_change is null then 0 else -1 end )  <>(TRGT.incident_resolved_by_change_c_key) and SRC.cdctype<>'D';
 
 

