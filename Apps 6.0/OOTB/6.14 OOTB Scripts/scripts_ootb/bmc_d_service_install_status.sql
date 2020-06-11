
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service.' ELSE 'SUCCESS' END as Message
FROM 
(
select SRC1.requestid, SRC2.value, SRC1.sourceinstance FROM
(SELECT * from #MDS_TABLE_SCHEMA.hlx_bmc_core_businessservice_final WHERE datasetid = 'BMC.ASSET' AND CDCTYPE<>'D')SRC1
JOIN
( SELECT enum_values.value,enum_values.enumId, enum_values.sourceinstance
FROM #MDS_TABLE_SCHEMA.hlx_field_enum_values_final enum_values
JOIN #MDS_TABLE_SCHEMA.hlx_field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId and 
enum_values.sourceinstance = field.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.hlx_arschema_final schma ON 
(field.schemaId=schma.schema_Id and field.sourceinstance = schma.sourceinstance and schma.overlaygroup=0) 
where field.fieldName ='ServiceLifeCycle' AND schma.NAME='BMC.CORE:BMC_BusinessService') SRC2
ON SRC2.enumId=SRC1.ServiceLifeCycle and SRC2.sourceinstance=SRC1.sourceinstance
) SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_service TRGT ON SRC.sourceinstance = TRGT.source_id
AND concat('BUSINESS_SERVICE~',SRC.requestid) = TRGT.row_id
WHERE COALESCE(SRC.value,'UNSPECIFIED') <>COALESCE(TRGT.install_status,'UNSPECIFIED')
