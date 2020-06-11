SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_portfolio.operating_loc_cost_target' ELSE 'SUCCESS' END as Message
FROM (select * from #DWH_TABLE_SCHEMA.f_portfolio where  row_key not in (0,-1))TRGT   
where TRGT.operating_loc_cost_target<> '0'