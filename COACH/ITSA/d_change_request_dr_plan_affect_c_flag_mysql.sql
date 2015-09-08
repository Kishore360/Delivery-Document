SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  from coach_mdsdb.change_request_final a
 left  JOIN  coach_mdwdb.d_change_request b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 where case when a.u_dr_plan_affect = 'Yes' then 'Y'
else when a.u_dr_plan_affect = 'No' then 'N'
else 'N'end <> b.dr_plan_affect_c_flag )b

