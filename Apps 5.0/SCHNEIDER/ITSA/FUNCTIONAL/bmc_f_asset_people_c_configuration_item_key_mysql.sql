 SELECT CASE WHEN count(1) > 0 THEN 'SUCCESS' ELSE 'FAILURE' END as Result,
 CASE WHEN count(1) >0 THEN 'SUCCESS' ELSE 'MDS to DWH data validation failed for f_asset_people_c.configuration_item_key'  END as Message
 -- SELECT COUNT(1)
 FROM schneider_mdsdb.ast_assetpeople_final SRC 
 left join (select reconciliationidentity, sourceinstance , max(requestid) as request_id 
from schneider_mdsdb.bmc_core_bmc_baseelement_final bse
where datasetid = 'BMC.ASSET'
group by reconciliationidentity , sourceinstance) bmc 
on SRC.assetinstanceid = bmc.reconciliationidentity and SRC.sourceinstance = bmc.sourceinstance
  JOIN  schneider_mdwdb.f_asset_people_c TRGT 
 ON (SRC.instanceid=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN schneider_mdwdb.d_configuration_item LKP 
 ON ( COALESCE(bmc.request_id,SRC.assetinstanceid,'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN COALESCE(bmc.request_id,SRC.assetinstanceid) IS NULL THEN 0 else '-1' end)<>(TRGT.configuration_item_key)