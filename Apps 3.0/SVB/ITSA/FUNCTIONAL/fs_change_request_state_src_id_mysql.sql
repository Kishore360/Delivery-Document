 SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from svb_workdb. fs_change_request b
 inner  JOIN  svb_mdsdb.change_request a
on  b.ROW_ID=SYS_ID and sourceinstance=b.source_id
 where a. u_change_state<> b. state_src_id)c