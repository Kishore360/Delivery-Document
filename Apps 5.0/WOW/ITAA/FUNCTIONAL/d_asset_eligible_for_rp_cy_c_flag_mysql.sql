SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM wow_mdwdb.d_asset d
JOIN wow_mdwdb.f_asset f ON d.row_key=f.asset_key
JOIN wow_mdwdb.d_lov l ON f.asset_status_key=l.row_key AND dimension_name= 'Installed'
JOIN wow_mdwdb.d_model_category  m ON f.model_category_key = m.row_key AND category_name = 'Computers'
where CASE WHEN d.is_not_eligible_for_rp_c = 'N' AND (COALESCE(YEAR(d.eligible_rp_date_c),0)=(SELECT YEAR(MAX(lastupdated)) 
FROM usf_mdwdb.d_o_data_freshness)) AND f.asset_owned_by_key <> 0 THEN 'Y' ELSE 'N' END<> d.eligible_for_rp_cy_c_flag 
)t;
