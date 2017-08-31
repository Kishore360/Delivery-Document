SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application.assigned_to' 
ELSE 'SUCCESS' END as Message from chneider_mdsdb.bmc_core_bmc_application SRC
join chneider_mdwdb.d_application TRGT 
on (SRC.instanceid = TRGT.row_id  and SRC.sourceinstance = TRGT.source_id ) 
join chneider_mdsdb.ast_assetpeople LKP on SRC.reconciliationidentity=LKP.assetinstanceid 
join chneider_mdsdb.ctm_people LKP1 on LKP.peoplegroupinstanceid=LKP1.instanceid 
where LKP.personrole = "Used by" 
and coalesce(LKP1.full_name,'UNSPECIFIED')<> coalesce(assigned_to,'');