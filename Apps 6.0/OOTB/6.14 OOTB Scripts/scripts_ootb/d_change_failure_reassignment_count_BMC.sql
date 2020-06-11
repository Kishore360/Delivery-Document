SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.reassignment_count' ELSE 'SUCCESS' END as Message
FROM  (select * from  #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999 and row_key not in (0,-1))TGT
left join (select Original_Request_ID, sourceinstance, count(1) as cnt from #MDS_TABLE_SCHEMA.hlx_chg_audit_log_final 
where Fields_Changed LIKE '%ASGRP%' 
group by Original_Request_ID, sourceinstance) SRC 
on TGT.row_id = SRC.Original_Request_ID and TGT.source_id = SRC.sourceinstance and TGT.row_key not in (0,-1)
where coalesce(TGT.reassignment_count,'') <>  coalesce(SRC.cnt,0)