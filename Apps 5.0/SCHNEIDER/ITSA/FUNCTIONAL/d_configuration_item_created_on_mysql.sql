SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.created_on' 
ELSE 'SUCCESS' END as Message 
from schneider_mdsdb.bmc_core_bmc_baseelement_final SRC
join schneider_mdwdb.d_configuration_item TRGT 
on (SRC.requestid = TRGT.row_id  and SRC.sourceinstance = TRGT.source_id ) 
where 
 from_unixtime(SRC.createdate) <> TRGT.created_on;