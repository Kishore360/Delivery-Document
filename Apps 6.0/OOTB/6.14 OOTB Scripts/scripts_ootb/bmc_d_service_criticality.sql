
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service.criticality' ELSE 'SUCCESS' END as Message
FROM  (SELECT * from #MDS_TABLE_SCHEMA.hlx_bmc_core_businessservice_final WHERE datasetid = 'BMC.ASSET' AND CDCTYPE<>'D')SRC1
LEFT JOIN  #DWH_TABLE_SCHEMA.d_service TRGT ON SRC1.sourceinstance = TRGT.source_id
AND concat('BUSINESS_SERVICE~',SRC1.requestid) = TRGT.row_id
LEFT OUTER JOIN  #DWH_TABLE_SCHEMA.d_lov lkp 
ON (SRC1.sourceinstance = lkp.source_id
AND concat('CRITICALITY~BUSINESS_SERVICE~',SRC1.priority) = lkp.row_id )
WHERE COALESCE(lkp.dimension_name,'UNSPECIFIED') <> COALESCE(TRGT.criticality,'')


