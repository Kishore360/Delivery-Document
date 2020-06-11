SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.company_key' ELSE 'SUCCESS' END as Message
 FROM  ( SELECT final.sourceinstance, final.incident_number, Company_Entry_Id, final.Company
 FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final final
 inner join #MDS_TABLE_SCHEMA.hlx_com_company_final comp
 on final.Company = comp.Company
 and final.sourceinstance = comp.sourceinstance
 WHERE final.CDCTYPE<>'D'
 ) SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization LKP 
 ON ( concat('SUBSIDIARY~', Company_Entry_Id) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.company_key ,'')