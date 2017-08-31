SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application.version' 
ELSE 'SUCCESS' END as Message from chneider_mdsdb.bmc_core_bmc_application SRC
join chneider_mdwdb.d_application TRGT 
on (SRC.instanceid = TRGT.row_id  and SRC.sourceinstance = TRGT.source_id ) 
where coalesce(SRC.versionnumber,'UNSPECIFIED')<> coalesce(TRGT.version,'UNSPECIFIED')