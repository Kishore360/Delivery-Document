SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
left join #MDS_TABLE_SCHEMA.bmc_ctm_people_final ppl
on (SRC.aslogid=ppl.Remedy_Login_id 
 AND SRC.sourceinstance=ppl.sourceinstance )
left join  #DWH_TABLE_SCHEMA.d_internal_contact IC
on (IC.source_id=SRC.sourceinstance
and CONCAT('INTERNAL_CONTACT~',ppl.Person_ID) = IC.row_id)
where coalesce(IC.row_key,case when SRC.aslogid is null then 0 else -1 end) <> coalesce(TRGT.assigned_to_key,'');