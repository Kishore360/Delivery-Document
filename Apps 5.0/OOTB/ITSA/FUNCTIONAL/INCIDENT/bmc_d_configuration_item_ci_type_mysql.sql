SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.ci_type' 
ELSE 'SUCCESS' END as Message from chneider_mdsdb.bmc_core_bmc_baseelement SRC
join chneider_mdwdb.d_configuration_item TRGT 
on (SRC.instanceid = TRGT.row_id  and SRC.sourceinstance = TRGT.source_id ) 
where coalesce(SRC.type,'UNSPECIFIED')<> coalesce(TRGT.ci_type ,'UNSPECIFIED')