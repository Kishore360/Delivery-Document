SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join  fidelity_mdwdb.d_internal_contact LKP
on  COALESCE(CONCAT('INTERNAL_CONTACT~', SRC.u_after_hours_contact), 'UNSPECIFIED')= LKP.row_id and SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key, case when SRC.u_after_hours_contact is null then 0 else -1 end )  <>(TRGT.after_hours_contact_c_key) and SRC.cdctype<>'D';
 
 

