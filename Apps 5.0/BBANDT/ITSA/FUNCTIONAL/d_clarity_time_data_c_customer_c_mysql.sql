SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.customer_c' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from bbandt_mdsdb.bbt_time_data_v_final src 
left join bbandt_mdwdb.d_clarity_time_data_c trgt
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where src.customer<>trgt.customer_c and src.CDCTYPE<>'D' and trgt.soft_deleted_flag='N')ma;