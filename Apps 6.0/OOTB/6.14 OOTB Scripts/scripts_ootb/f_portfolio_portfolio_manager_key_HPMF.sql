SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for F_PORTFOLIO.portfolio_manager_key' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final where cdctype<>'D') SRC
left join(select min(user_id) as mgr,portfolio_id,sourceinstance from #MDS_TABLE_SCHEMA.hp_pfm_portfolio_managers_final group by portfolio_id)SRC1
on SRC.PORTFOLIO_ID=SRC1.PORTFOLIO_ID
and SRC.sourceinstance=SRC1.sourceinstance
left join #DWH_TABLE_SCHEMA.f_portfolio TRGT
on SRC.PORTFOLIO_ID=TRGT.ROW_ID
AND SRC.SOURCEINSTANCE=TRGT.SOURCE_ID
left join #DWH_TABLE_SCHEMA.d_internal_contact LKP
on (LKP.row_id  = CONCAT('INTERNAL_CONTACT~',SRC1.mgr) and LKP.source_id  = SRC.sourceinstance)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.mgr is null THEN 0 else '-1' end)<> COALESCE(TRGT.portfolio_manager_key,'0');
