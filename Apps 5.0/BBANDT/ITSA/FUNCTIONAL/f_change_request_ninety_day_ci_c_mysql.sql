SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.ninety_day_ci_c' ELSE 'SUCCESS' END as Message 
 from bbandt_mdwdb.final_inc_count_2_c d_cnt
 join bbandt_mdwdb.f_change_request a11
 ON a11.change_request_key = d_cnt.change_request_key AND five_d >0 
 where d_cnt.ninety_d<>a11.ninety_day_ci_c
 and a11.soft_deleted_flag='N';