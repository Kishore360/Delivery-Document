

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_storage_location' ELSE 'SUCCESS' END as Message 


from ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_stockroom_final WHERE CDCTYPE<>'D') SRC

left join #DWH_TABLE_SCHEMA.d_storage_location TRGT
on SRC.sys_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id

left join #DWH_TABLE_SCHEMA.d_location LKP
on SRC.location=LKP.row_id
and SRC.sourceinstance=LKP.source_id

where coalesce(SRC.name,'')<>coalesce(TRGT.location_name,'')
or coalesce(SRC.type,'')<>coalesce(TRGT.location_type,'')
or coalesce(SRC.manager,'')<>coalesce(TRGT.manager,'')
or coalesce(case when SRC.external=1 then 'Y' else 'N' end ,'N')<>coalesce(TRGT.is_external,'')
or coalesce(null,'')<>coalesce(TRGT.parent_row_id,'')
or coalesce( LKP.row_key ,case when SRC.location is null then '0' else '-1' end )<>coalesce(TRGT.location_key,'')

or coalesce(SRC.sys_created_by,'')<>coalesce(TRGT.CREATED_BY,'')
or coalesce(SRC.sys_updated_by,'')<>coalesce(TRGT.CHANGED_BY,'')
or coalesce(convert_tz(SRC.sys_created_on, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.CREATED_ON,'')
or coalesce(convert_tz(SRC.sys_updated_on, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.CHANGED_ON,'')

