SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.criticality' 
ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.bmc_core_bmc_businessservice_final SRC JOIN schneider_mdwdb.d_service TRGT 
ON (concat('BUSINESS_SERVICE','~',SRC.requestid)) = TRGT.row_id 
JOIN (SELECT enum_values.value,enum_values.enumId, enum_values.sourceinstance
FROM schneider_mdsdb.field_enum_values_final enum_values
JOIN schneider_mdsdb.field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId and enum_values.sourceinstance = field.sourceinstance)
JOIN schneider_mdsdb.arschema_final schma ON (field.schemaId=schma.schemaId and field.sourceinstance = schma.sourceinstance) where field.fieldName ='Priority' AND schma.NAME='BMC.CORE:BMC_BusinessService') priority on SRC.priority = priority.enumId and SRC.sourceinstance = priority.sourceinstance and SRC.datasetid = 'BMC.ASSET'
where  priority.value  <> (TRGT.criticality) 
