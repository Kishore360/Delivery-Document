SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.portfolio_levels_mv_final SRC
JOIN  fidelity_mdwdb.d_cost_center TRGT 
ON (SRC.cc_code = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
where SRC.level_1_desc<>  TRGT.cc_lev_1_c