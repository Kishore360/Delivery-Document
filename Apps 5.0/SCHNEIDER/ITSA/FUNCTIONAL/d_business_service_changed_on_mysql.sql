SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.changed_on' 
ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.bmc_core_bmc_businessservice_final SRC JOIN schneider_mdwdb.d_service TRGT 
ON (concat('BUSINESS_SERVICE','~',SRC.requestid) = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE 
from_unixtime(SRC.modifieddate ) <> (TRGT.changed_on) 
	