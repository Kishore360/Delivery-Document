

SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'MDS to DWH data validation failed for d_service.SOFT_DELETED_FLAG' ELSE 'SUCCESS' END as Message 
from  (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_bmc_core_businessservice_final WHERE datasetid = 'BMC.ASSET'  AND CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_service TRGT 
on TRGT.row_id=CONCAT('BUSINESS_SERVICE','~',SRC.requestid)  and  SRC.SourceInstance = TRGT.source_id
WHERE (CASE WHEN SRC.markasdeleted = 1 THEN 'Y' ELSE 'N' end ) <> COALESCE(TRGT.SOFT_DELETED_FLAG,'')