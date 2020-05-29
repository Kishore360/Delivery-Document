SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.created_by' ELSE 'SUCCESS' END as Message
FROM ( SELECT hpd.customer_login_id,hpd.submitter,hpd.sourceinstance,hpd.incident_number,submitter_lkp.person_id
FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final hpd
left join #MDS_TABLE_SCHEMA.hlx_ctm_people_final submitter_lkp 
on hpd.customer_login_id = submitter_lkp.remedy_login_id 
and hpd.sourceinstance = submitter_lkp.sourceinstance
WHERE hpd.CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
ON (SRC.incident_number=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
on ( concat('INTERNAL_CONTACT~',SRC.person_id) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.customer_login_id IS NULL THEN '0' else '-1' end)<> COALESCE(TRGT.caller_key,'')