SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.u_fmr_business_events_final  SRC 
JOIN fidelity_mdwdb.d_fmr_business_events_c TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join fidelity_mdwdb.d_internal_contact LKP
on case  when coalesce(SRC.u_business_event_contact, 'UNSPECIFIED')='UNSPECIFIED' then 'UNSPECIFIED'  else  concat('INTERNAL_CONTACT~', coalesce(SRC.u_business_event_contact, 'UNSPECIFIED'))end= LKP.row_id AND SRC.sourceinstance = LKP.source_id 
 WHERE  coalesce(LKP.row_key, case when SRC.u_business_event_contact is null then 0 else -1 end )<>(TRGT.u_business_event_contact_c_key) and SRC.cdctype<>'D';
 
 

