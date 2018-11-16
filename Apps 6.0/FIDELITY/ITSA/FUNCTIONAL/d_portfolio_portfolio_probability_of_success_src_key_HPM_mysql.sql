SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_portfolio.portfolio_probability_of_success_src_key' ELSE 'SUCCESS' END as Message
from (select *from  fidelity_mdsdb.hp_pfm_portfolios_final) SRC
left join  fidelity_mdwdb.d_portfolio TRGT
on SRC.portfolio_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.portfolio_probability_of_success_src_key,'')<>0