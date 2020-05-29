SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_resource_role.changed_on' ELSE 'SUCCESS' END as Message
FROM ( select * from  #MDS_TABLE_SCHEMA.srm_resources_final  where  cdctype<>'D') SRC 
INNER JOIN (select * from #MDS_TABLE_SCHEMA.prj_resources_final where prisrole=1 and cdctype<>'D')SRC1
on SRC.id=SRC1.PRID
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_resource_role)TRGT   
	ON SRC.id =TRGT.row_id
    and SRC.sourceinstance=TRGT.source_id	
WHERE COALESCE(convert_tz(SRC.last_updated_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> coalesce(TRGT.changed_on,'')