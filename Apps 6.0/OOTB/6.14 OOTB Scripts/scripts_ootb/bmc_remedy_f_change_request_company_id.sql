SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization LKP 
ON SRC.company = LKP.organization_name 
AND SRC.sourceinstance = LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.company_key ,'')
 
 
