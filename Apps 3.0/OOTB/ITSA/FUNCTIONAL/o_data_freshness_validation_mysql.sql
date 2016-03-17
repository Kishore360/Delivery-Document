SELECT CASE WHEN count(1) =1 THEN 'SUCCESS' ELSE 'FAILURE' END as Result,
 CASE WHEN count(1) =1 THEN 'SUCCESS' ELSE 'FAILURE' END as Message
 FROM <<tenant>>_mdwdb.d_o_data_freshness 