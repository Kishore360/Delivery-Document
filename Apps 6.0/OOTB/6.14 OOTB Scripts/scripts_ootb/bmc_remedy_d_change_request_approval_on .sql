SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.approved_on' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE coalesce(convert_tz(SRC.sfa_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) <> TRGT.approval_on 
