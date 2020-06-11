SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.row_count' ELSE 'SUCCESS' END as Message
from (select * from
(select count(*) count_src,SRC.sourceinstance from #MDS_TABLE_SCHEMA.hp_kcrt_requests_final SRC 
left join #MDS_TABLE_SCHEMA.hp_kcrt_request_types_nls_final SRC1
on SRC.request_type_id=SRC1.request_type_id
and SRC.sourceinstance=SRC1.sourceinstance
where SRC.cdctype<>'D' 
and SRC1.reference_code='_PFM_PROPOSAL') count_src,
(select count(*) as count_trgt,source_id from  #DWH_TABLE_SCHEMA.d_demand where row_key not in (0,-1) and soft_deleted_flag='N')count_trgt
where count_src.count_src <> count_trgt.count_trgt and count_src.sourceinstance=count_trgt.source_id
)SQ ;