SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  from coach_mdsdb.change_request_final a
 left  JOIN  coach_mdwdb.d_change_request b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 where case when a.u_help_desk_communication = 1 then 'Y'else 'N'end <> b.help_desk_communication_c_flag )b

