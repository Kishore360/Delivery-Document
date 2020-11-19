SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join  fidelity_mdwdb.d_batch_onetime_datacenter_c LKP
on  COALESCE(SRC.u_batch_onetime_datacenter, 'UNSPECIFIED')= LKP.row_id and SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key, case when SRC.u_batch_onetime_datacenter is null then 0 else -1 end )  <>(TRGT.batch_onetime_datacenter_c_key) and SRC.cdctype<>'D';
 
 

