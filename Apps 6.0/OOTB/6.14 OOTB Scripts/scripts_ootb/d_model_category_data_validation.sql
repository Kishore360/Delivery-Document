

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_model_category' ELSE 'SUCCESS' END as Message 


from ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_model_category_final WHERE CDCTYPE<>'D') SRC

left join #DWH_TABLE_SCHEMA.d_model_category TRGT
on SRC.sys_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id


where coalesce(SRC.name,'')<>coalesce(TRGT.category_name,'')
or coalesce(SRC.asset_class,'')<>coalesce(TRGT.asset_class,'')
or coalesce(SRC.cmdb_ci_class,'')<>coalesce(TRGT.item_class,'')
or coalesce(SRC.sys_created_by,'')<>coalesce(TRGT.CREATED_BY,'')
or coalesce(SRC.sys_updated_by,'')<>coalesce(TRGT.CHANGED_BY,'')
or coalesce(convert_tz(SRC.sys_created_on, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.CREATED_ON,'')
or coalesce(convert_tz(SRC.sys_updated_on, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.CHANGED_ON,'')

