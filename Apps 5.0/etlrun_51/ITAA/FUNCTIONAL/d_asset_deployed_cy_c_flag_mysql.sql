SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt from
wow_mdwdb.d_asset
where 
deployed_cy_c_flag <>
(
case
                when 
                                (YEAR(deployed_date_c) = (SELECT YEAR(MAX(lastupdated)) 
                                                FROM wow_mdwdb.d_o_data_freshness))
                then 'Y'
                else 'N'
END
))a
