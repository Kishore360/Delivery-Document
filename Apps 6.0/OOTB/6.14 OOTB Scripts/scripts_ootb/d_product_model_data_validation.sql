-- Updated WH_MODEL_TYPE as NULL as part of JIRA ITSM-4672

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_product_model' ELSE 'SUCCESS' END as Message 
/*
select
 coalesce(SRC.sys_created_by,'') as sys_created_by, coalesce(TRGT.CREATED_BY,'')
 , coalesce(SRC.sys_updated_by,''),coalesce(TRGT.CHANGED_BY,'')
, coalesce(convert_tz(SRC.sys_created_on,source_time_zone,target_time_zone),''),coalesce(TRGT.CREATED_ON,'')
, coalesce(convert_tz(SRC.sys_updated_on,source_time_zone,target_time_zone),''),coalesce(TRGT.CHANGED_ON,'')
*/
from ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_model_final WHERE CDCTYPE<>'D') SRC

left join #DWH_TABLE_SCHEMA.d_product_model TRGT
on SRC.sys_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.us_model_asset_type_map_final WHERE CDCTYPE<>'D') LKP
on SRC.name=LKP.model_name
and SRC.model_number=LKP.model_number
and SRC.type=LKP.model_type

where coalesce(SRC.name,'')<>coalesce(TRGT.model_name,'')
or coalesce(SRC.display_name,'')<>coalesce(TRGT.display_name,'')
or coalesce(SRC.manufacturer,'')<>coalesce(TRGT.manufacturer,'')
or coalesce(SRC.short_description,'')<>coalesce(TRGT.SHORT_DESC,'')
or coalesce(SRC.comments,'')<>coalesce(TRGT.LONG_DESC,'')
or coalesce(SRC.model_number,'')<>coalesce(TRGT.model_number,'')
or coalesce(SRC.type,'')<>coalesce(TRGT.MODEL_TYPE,'')
or coalesce(case when SRC.certified=1 then 'Y' else 'N' end,'N')<>coalesce(TRGT.IS_CERTIFIED,'')
or coalesce(SRC.status,'')<>coalesce(TRGT.MODEL_STATUS,'')
or coalesce(SRC.barcode,'')<>coalesce(TRGT.MODEL_BARCODE,'')
or coalesce(SRC.acquisition_method,'')<>coalesce(TRGT.ACQ_METHOD,'')
or coalesce(SRC.sys_class_name,'')<>coalesce(TRGT.MODEL_CLASS_NAME,'')
or coalesce(SRC.owner,'')<>coalesce(TRGT.owner,'')
or coalesce(null,'')<>coalesce(TRGT.parent_row_id,'')
or NULL<>coalesce(TRGT.WH_MODEL_TYPE,'')
 or coalesce(SRC.sys_created_by,'')<>coalesce(TRGT.CREATED_BY,'')
 or coalesce(SRC.sys_updated_by,'')<>coalesce(TRGT.CHANGED_BY,'')
or coalesce(convert_tz(SRC.sys_created_on, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.CREATED_ON,'')
or coalesce(convert_tz(SRC.sys_updated_on, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.CHANGED_ON,'')

