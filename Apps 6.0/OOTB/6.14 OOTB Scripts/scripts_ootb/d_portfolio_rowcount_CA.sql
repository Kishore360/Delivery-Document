SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_portfolio' ELSE 'SUCCESS' END as Message
 from (
 select count_src
 from
 (select sourceinstance,count(*) count_src from #MDS_TABLE_SCHEMA.pfm_portfolios_final SRC where cdctype<>'D'
 group by sourceinstance) count_src
 left outer join
 (select source_id,count(*) count_trgt from #DWH_TABLE_SCHEMA.d_portfolio TRGT where TRGT.row_key not in (0, -1)
 group by source_id) count_trgt
 on count_src.sourceinstance=count_trgt.source_id where count_src.count_src <>count_trgt.count_trgt)SQ