SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
left join  #MDS_TABLE_SCHEMA.hlx_ctm_people_final ppl
on (SRC.assignee_login_id=ppl.Remedy_Login_id 
 AND SRC.sourceinstance=ppl.sourceinstance )
left join  #DWH_TABLE_SCHEMA.d_internal_contact IC
on (IC.source_id=SRC.sourceinstance
and CONCAT('INTERNAL_CONTACT~',ppl.Person_ID) = IC.row_id)
where coalesce(IC.row_key,case when SRC.assignee_login_id is null then 0 else -1 end) <> coalesce(TRGT.assigned_to_key,'');