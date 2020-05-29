SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.changed_on' 
ELSE 'SUCCESS' END as Message from schneider_mdsdb.bmc_core_bmc_baseelement_final SRC
join schneider_mdwdb.d_configuration_item TRGT 
on (SRC.instanceid = TRGT.row_id  and SRC.sourceinstance = TRGT.source_id ) 
where 
coalesce(convert_tz(SRC.modifieddate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'UNSPECIFIED')<>TRGT.changed_on;
