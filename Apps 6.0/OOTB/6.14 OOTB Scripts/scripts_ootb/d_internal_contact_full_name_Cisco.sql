SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.full_name' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_final WHERE CDCTYPE<>'D') SRC
 left join ( SELECT * FROM #MDS_TABLE_SCHEMA.person_final WHERE CDCTYPE<>'D') pe
 on (pe.personid = SRC.personid and pe.sourceinstance = SRC.sourceinstance) 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
 	 ON (concat('INTERNAL_CONTACT~',SRC.peripheralid,'~',SRC.skilltargetid)  = TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
 WHERE coalesce(SRC.enterprisename,'')  <> coalesce(TRGT.full_name,'')
 
 