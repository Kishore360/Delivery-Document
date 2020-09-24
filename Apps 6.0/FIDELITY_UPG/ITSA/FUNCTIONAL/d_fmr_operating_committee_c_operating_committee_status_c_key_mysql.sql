SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.u_fmr_operating_committee_final  SRC 
JOIN fidelity_mdwdb.d_fmr_operating_committee_c TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join  fidelity_mdwdb.d_lov LKP
on  COALESCE(CONCAT('STATUS_C~OPERATING_COMMITTEE~', SRC.u_status, 'UNSPECIFIED'))= LKP.row_id and
SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key, case when SRC.u_status is null then 0 else -1 end )  <>(TRGT.operating_committee_status_c_key) and SRC.cdctype<>'D';
 
 

