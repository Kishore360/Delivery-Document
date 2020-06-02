SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.work_item_created_on_key' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN  #DWH_TABLE_SCHEMA.d_calendar_date LKP
ON (date_format(convert_tz(SRC.createdDate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') = LKP.row_id)
 WHERE coalesce(LKP.row_key, 0) <> coalesce(TRGT.work_item_created_on_key,'');