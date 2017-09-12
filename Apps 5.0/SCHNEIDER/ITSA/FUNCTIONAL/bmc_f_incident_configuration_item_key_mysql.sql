
SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt > 0  THEN 'MDS to DWH data validation failed for f_incident.configuration_item_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
left join (select name, sourceinstance,max(reconciliationidentity) as latest_ci 
from schneider_mdsdb.bmc_core_bmc_baseelement_final where datasetid = 'BMC.ASSET' and classid <> 'BMC_PERSON'  and (name,createdate) in (select name,max(createdate) as latest_date
from schneider_mdsdb.bmc_core_bmc_baseelement_final where datasetid = 'BMC.ASSET' and classid <> 'BMC_PERSON' 
group by 1)group by 1, 2) src1 on SRC.ci = src1.name and trgt.source_id = src1.sourceinstance
LEFT JOIN schneider_mdwdb.d_application LKP 
 ON ( COALESCE(src1.latest_ci,'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.ci IS NULL THEN 0 else -1 end)<> (TRGT.configuration_item_key))a;
