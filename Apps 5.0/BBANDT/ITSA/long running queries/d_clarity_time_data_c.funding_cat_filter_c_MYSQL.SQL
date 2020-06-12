SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.funding_cat_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.funding_cat_filter_c <>src.funding_cat_filter