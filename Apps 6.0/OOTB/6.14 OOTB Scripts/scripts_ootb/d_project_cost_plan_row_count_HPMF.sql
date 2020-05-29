 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_resource_availability' ELSE 'SUCCESS' END as Message
from (
select count_src
from
  (
select SRC1.sourceinstance, COUNT(*) count_src FROM
(select * from #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final  where cdctype<>'D')SRC1
inner join 
(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final where cdctype<>'D')SRC2
on SRC1.FINANCIAL_SUMMARY_ID = SRC2.PRJ_FINANCIAL_SUMMARY_ID and SRC1.sourceinstance=SRC2.sourceinstance
) count_src
left outer join
(select source_id,count(*) count_trgt from #DWH_TABLE_SCHEMA.d_project_cost_plan TRGT where TRGT.row_key not in (0, -1)
and soft_deleted_flag='N' group by source_id) count_trgt
on count_src.sourceinstance=count_trgt.source_id where count_src.count_src <>count_trgt.count_trgt)SQ
