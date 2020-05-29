-- Added scripts as part of JIRA ITSM-4670

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_master_item.item_type_code_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_cat_item_final WHERE CDCTYPE<>'D') SRC 
   left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_category_final WHERE CDCTYPE<>'D') cat
 on SRC.category =cat.sys_id
 and SRC.sourceinstance=cat.sourceinstance
 LEFT JOIN #DWH_TABLE_SCHEMA.d_master_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( concat('SC~ITEM~CATEGORY~CODE','~',upper(cat.sys_id)) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE cat.sys_id is not null and
 COALESCE(LKP.row_key,CASE WHEN cat.sys_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.item_type_code_key ,'')
