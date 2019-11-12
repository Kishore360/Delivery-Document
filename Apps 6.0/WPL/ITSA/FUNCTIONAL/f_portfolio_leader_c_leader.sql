SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_portfolio_leader_c.leader' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.us_MATFN_PortfolioLeader_final  src
left join wpl_mdwdb.f_portfolio_leader_c trgt on  CONCAT(src.leader,'~',src.portfolio)=trgt.row_id and src.sourceinstance=trgt.source_id
where src.cdctype<>'D' and   src.leader  <>trgt.leader
) temp; 
