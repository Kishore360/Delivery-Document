SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.created_by' ELSE 'SUCCESS' END as Message
FROM ( SELECT chg.submitter,chg.sourceinstance,chg.infrastructure_change_id,submitter_lkp.person_id
FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final chg
left join #MDS_TABLE_SCHEMA.hlx_ctm_people_final submitter_lkp 
on chg.submitter = submitter_lkp.remedy_login_id 
and chg.sourceinstance = submitter_lkp.sourceinstance
WHERE chg.CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
on ( concat('INTERNAL_CONTACT~',SRC.person_id) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.person_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_key ,'')