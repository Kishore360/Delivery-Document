SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reassignment_count' ELSE 'SUCCESS' END as Message
from
(select count(1) as reassignment_count_expected ,TGT.row_id,TGTF.reassignment_count
FROM #DWH_TABLE_SCHEMA.d_change_request TGT
left join #DWH_TABLE_SCHEMA.f_change_request TGTF
on(TGT.row_key=TGTF.change_request_key)
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=TGTF.state_src_key)
left join #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final SRC
on (TGT.row_id = SRC.documentkey 
and TGT.source_id = SRC.sourceinstance)
where  tablename='chg_change_request' and upper(fieldname)='ASGRP'  
and oldvalue is not NULL and (SRC.cdctype <> 'D' )
and case when LM.dimension_wh_code<>'OPEN' then TGT.closed_on else now() end > SRC.sys_created_on 
group by TGT.row_id,TGTF.reassignment_count) S
where reassignment_count_expected <> reassignment_count