SELECT CASE WHEN count(1) > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message  from 
wow_mdwdb.d_change_request  trgt
 JOIN wow_mdsdb.change_request_final src
on trgt.row_id= src.sys_id and trgt.source_id = src.sourceinstance
 where  trgt.completed_within_window_c_flag<>case when src.u_completed_within_window=1 then 'Y' else 'N' end;
 
 


