
SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from
watson_mdsdb.incident_final a12
left join watson_mdwdb.d_customerservice_case_c a14 on a12.u_case=a14.row_id and a12.sourceinstance=a14.source_id
 join watson_mdwdb.f_incident a122
on a122.row_id=a12.sys_id and a122.source_id=a12.sourceinstance
where coalesce(a14.row_key,case when a12.u_case is null then 0 else -1 end)<>a122.customerservice_case_c_key)acv


