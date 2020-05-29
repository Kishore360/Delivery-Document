SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.subcategory' ELSE 'SUCCESS' END as Message
 FROM 
( SELECT SRC.requestid,SRC.SourceInstance,field_enum_values.value FROM
    (SELECT * from #MDS_TABLE_SCHEMA.hlx_bmc_core_application_final WHERE datasetid = 'BMC.ASSET' AND CDCTYPE<>'D') SRC                  
            LEFT OUTER JOIN
                #MDS_TABLE_SCHEMA.hlx_field_enum_values_final field_enum_values 
                    ON field_enum_values.sourceinstance=SRC.sourceinstance 
                    AND field_enum_values.enumid=SRC.status 
            LEFT OUTER JOIN
                #MDS_TABLE_SCHEMA.hlx_field_final field 
                    ON field.fieldid=field_enum_values.fieldid 
                    AND field.schemaid=field_enum_values.schemaid  
            LEFT OUTER JOIN
                #MDS_TABLE_SCHEMA.hlx_arschema_final arschema 
                    ON arschema.schema_id=field.schemaid       
            WHERE
                arschema.name='BMC.CORE:BMC_Application'
                AND  field.fieldName in ('Status')) SRC1
 LEFT JOIN #DWH_TABLE_SCHEMA.d_application TRGT 
 ON (concat('APPLICATION~', SRC1.requestid)  =TRGT.row_id  
 AND SRC1.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC1.value,'')<> COALESCE(TRGT.install_status,'')
