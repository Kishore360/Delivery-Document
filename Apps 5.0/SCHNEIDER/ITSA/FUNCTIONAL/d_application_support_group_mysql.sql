SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application.support_group' 
ELSE 'SUCCESS' END as Message
from schneider_mdsdb.bmc_core_bmc_application_final SRC
join schneider_mdwdb.d_application TRGT 
on (concat('APPLICATION~',ifnull(SRC.requestid,'')) = TRGT.row_id  and SRC.sourceinstance = TRGT.source_id ) 
join schneider_mdsdb.ast_assetpeople_final LKP on SRC.reconciliationidentity=LKP.assetinstanceid
join schneider_mdsdb.ctm_support_group_final LKP1 on LKP.peoplegroupinstanceid=LKP1.instanceid
where LKP.personrole="Supported by"
and coalesce(LKP1.support_group_name,'UNSPECIFIED') <>coalesce(support_group,'')