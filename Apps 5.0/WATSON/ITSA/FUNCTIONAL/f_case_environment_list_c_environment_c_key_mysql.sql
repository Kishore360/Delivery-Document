  
SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from
watson_mdsdb.sn_customerservice_case_final  a12
join watson_mdwdb.d_environment_c a14 on a12.u_environment=a14.row_id and a12.sourceinstance=a14.source_id
 join watson_mdwdb.f_case_environment_list_c a122
on a122.row_id=a12.sys_id and a122.source_id=a12.sourceinstance
where coalesce(a14.row_key,case when a12.u_environment is null then 0 else -1 end)<>a122.environment_c_key)acv

