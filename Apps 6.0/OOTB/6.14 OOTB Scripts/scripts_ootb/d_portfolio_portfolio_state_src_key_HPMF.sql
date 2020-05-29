SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_portfolio.PORTFOLIO_STATE_SRC_KEY' ELSE 'SUCCESS' END as Message
from(select * from #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_portfolio TRGT
on SRC.portfolio_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.PORTFOLIO_STATE_SRC_KEY<>0