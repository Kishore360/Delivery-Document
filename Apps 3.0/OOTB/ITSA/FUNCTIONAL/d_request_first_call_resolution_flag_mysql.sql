SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request_item.first_call_resolution_flag' ELSE 'SUCCESS' END as Message FROM(
select count(1) cnt from <<tenant>>_mdwdb.d_request TRGT
where
case when 
 TIMESTAMPDIFF(MINUTE,TRGT.opened_on,closed_on)<30 then 'Y' else 'N' end <>TRGT.first_call_resolution_flag)x