SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application.department' 
ELSE 'SUCCESS' END as Message from schneider_mdsdb.bmc_core_bmc_application_final_final SRC
join schneider_mdwdb.d_application TRGT 
on (SRC.instanceid = TRGT.row_id  and SRC.sourceinstance = TRGT.source_id ) 
where coalesce(SRC.department,'UNSPECIFIED')<> coalesce(TRGT.department ,'UNSPECIFIED')