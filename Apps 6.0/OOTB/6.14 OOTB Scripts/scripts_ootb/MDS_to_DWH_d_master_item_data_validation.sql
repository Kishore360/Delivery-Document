-- Updated item_category and item_type_code as NULL as part of JIRA ITSM-4670
 select 
 case when count(1)>1 then 'FAILURE' else 'SUCCESS' end as status,
 case when count(1)>1 then 'MDS to DWH for d_master_item failed' else 'SUCCESS' end as message
 from ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_cat_item_final WHERE CDCTYPE<>'D') SRC
  left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_category_final WHERE CDCTYPE<>'D') cat
 on SRC.category =cat.sys_id
 and SRC.sourceinstance=cat.sourceinstance
 left join   #DWH_TABLE_SCHEMA.d_master_item TRGT
 on SRC.sys_id=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(SRC.sys_id,'')<>coalesce(TRGT.item_number,'')
 or coalesce(SRC.name,'')<>coalesce(TRGT.item_name,'')
 or coalesce(replace(replace(SRC.short_description,'n',''),' ',''),'')<>coalesce(TRGT.item_description,'')
 or NULL<>coalesce(TRGT.item_category,'')
 or NULL<>coalesce(TRGT.item_type_code,'')
 or coalesce(TRGT.STORAGE_WH_UOM,'')<>''
 or  coalesce(TRGT.MANUFACTURER_NAME,'')<>''
 or coalesce(TRGT.parent_row_id,'')<>''
 or coalesce(SRC.sys_created_by,'')<>coalesce(TRGT.created_by,'')
 or coalesce(SRC.sys_updated_by,'')<>coalesce(TRGT.changed_by,'')
 or convert_tz(SRC.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')<> coalesce(TRGT.created_on,'')
 or convert_tz(SRC.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')<> coalesce(TRGT.changed_on,'')
