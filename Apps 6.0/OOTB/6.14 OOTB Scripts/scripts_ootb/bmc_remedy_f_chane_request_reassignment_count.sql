SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reassignment_count' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_change_request TGT
left join (select documentkey, sourceinstance, count(1) as cnt from #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final 
where tablename='bmc_chg_infrastructure_change_sys_audit_final' and fieldname='ASGRP' 
and oldvalue is not NULL and (cdctype <> 'D' )
group by documentkey, sourceinstance) SRC 
on TGT.row_id = SRC.documentkey and TGT.source_id = SRC.sourceinstance

where coalesce(TGT.reassignment_count,'') <>  coalesce(SRC.cnt,0)