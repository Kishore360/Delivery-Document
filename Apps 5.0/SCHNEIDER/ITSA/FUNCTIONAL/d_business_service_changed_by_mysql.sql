SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.changed_by' 
ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.bmc_core_bmc_businessservice_final SRC JOIN schneider_mdwdb.d_service TRGT 
ON (SRC.instanceid = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.lastmodifiedby <> (TRGT.changed_by) 
	