select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row count failed for d_internal_contact' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'TFS_DWS') ODF on ODF.source_id = TRGT.source_id
where TRGT.soft_deleted_flag = 'N' and TRGT.row_key not in (0,-1, -2)
) A, 
(select count(*) count_2 FROM #MDS_TABLE_SCHEMA.dimperson_final SRC) B
where count_1 <> count_2) SQ;