SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.phase_indicator_id_c' ELSE 'SUCCESS' END as Message 

FROM (select count(1) as cnt from 

bbandt_mdsdb.bbt_time_data_v_final src 
left join 
bbandt_mdwdb.d_clarity_time_data_c trgt 
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id

where trgt.phase_indicator_id_c <>src.phase_indicator_id) temp;