

SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'MDS to DWH data validation failed for d_service.used_for_src_id' ELSE 'SUCCESS' END as Message 
from 
( SELECT * FROM  #MDS_TABLE_SCHEMA.hlx_bmc_core_businessservice_final WHERE datasetid = 'BMC.ASSET' AND CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_service TRGT 
on TRGT.row_id=CONCAT('BUSINESS_SERVICE','~',SRC.requestid)  and  SRC.sourceinstance = TRGT.source_id
WHERE 0 <> COALESCE(TRGT.used_for_src_key,'') and TRGT.row_key not in (0,-1)
