
SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'MDS to DWH data validation failed for d_service.source_id' ELSE 'SUCCESS' END as Message 
from (
SELECT requestid, sourceinstance, CASE WHEN markasdeleted = 1 THEN 'Y' ELSE 'N' END SOFT_DELETED_FLAG , CreateDate
FROM #MDS_TABLE_SCHEMA.hlx_bmc_core_businessservice_final where datasetid = 'BMC.ASSET'

UNION
 
SELECT A.requestid, A.sourceinstance, CASE WHEN A.markasdeleted = 1 THEN 'Y' ELSE 'N' END SOFT_DELETED_FLAG, CreateDate FROM #MDS_TABLE_SCHEMA.hlx_bmc_core_businessservice_final A
JOIN (SELECT enum_values.value,enum_values.enumId, enum_values.sourceinstance
FROM #MDS_TABLE_SCHEMA.hlx_field_enum_values_final enum_values
JOIN #MDS_TABLE_SCHEMA.hlx_field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId and enum_values.sourceinstance = field.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.hlx_arschema_final schma ON (field.schemaId=schma.schema_Id and field.sourceinstance = schma.sourceinstance and schma.overlaygroup=0) where field.fieldName ='Priority' AND schma.NAME='BMC.CORE:BMC_BusinessService') priority on A.priority = priority.enumId and A.sourceinstance = priority.sourceinstance where A.datasetid = 'BMC.ASSET'

UNION
 
SELECT A.requestid, A.sourceinstance, CASE WHEN A.markasdeleted = 1 THEN 'Y' ELSE 'N' END SOFT_DELETED_FLAG, CreateDate FROM #MDS_TABLE_SCHEMA.hlx_bmc_core_businessservice_final A
JOIN (SELECT enum_values.value,enum_values.enumId, enum_values.sourceinstance
FROM #MDS_TABLE_SCHEMA.hlx_field_enum_values_final enum_values
JOIN #MDS_TABLE_SCHEMA.hlx_field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId and enum_values.sourceinstance = field.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.hlx_arschema_final schma ON (field.schemaId=schma.schema_Id and field.sourceinstance = schma.sourceinstance and schma.overlaygroup=0) where field.fieldName ='ServiceType' AND schma.NAME='BMC.CORE:BMC_BusinessService') service_type on A.ServiceType = service_type.enumId and A.sourceinstance = service_type.sourceinstance where A.datasetid = 'BMC.ASSET'

UNION 

SELECT A.requestid, A.sourceinstance, CASE WHEN A.markasdeleted = 1 THEN 'Y' ELSE 'N' END SOFT_DELETED_FLAG, CreateDate FROM #MDS_TABLE_SCHEMA.hlx_bmc_core_businessservice_final A
JOIN (SELECT enum_values.value,enum_values.enumId, enum_values.sourceinstance
FROM #MDS_TABLE_SCHEMA.hlx_field_enum_values_final enum_values
JOIN #MDS_TABLE_SCHEMA.hlx_field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId and enum_values.sourceinstance = field.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.hlx_arschema_final schma ON (field.schemaId=schma.schema_Id and field.sourceinstance = schma.sourceinstance and schma.overlaygroup=0) where field.fieldName ='ServiceLifeCycle' AND schma.NAME='BMC.CORE:BMC_BusinessService') service_lifecycle on A.ServiceLifeCycle = service_lifecycle.enumId and A.sourceinstance = service_lifecycle.sourceinstance where A.datasetid = 'BMC.ASSET'


) SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_service TRGT 
on TRGT.row_id=CONCAT('BUSINESS_SERVICE','~',SRC.requestid)  and  SRC.SourceInstance = TRGT.source_id
WHERE COALESCE(SRC.SourceInstance,'') <> COALESCE(TRGT.source_id,'')


