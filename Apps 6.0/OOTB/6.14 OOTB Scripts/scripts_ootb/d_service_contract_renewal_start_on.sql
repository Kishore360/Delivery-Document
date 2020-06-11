SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_contract.renewal_start_on' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.ast_contract_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_service_contract TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.row_key not in (0,-1) and SRC.account is not null AND
COALESCE(date_format(convert_tz(SRC.renewal_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'')<> COALESCE(date_format(TRGT.renewal_start_on,'%Y%m%d'),'')
