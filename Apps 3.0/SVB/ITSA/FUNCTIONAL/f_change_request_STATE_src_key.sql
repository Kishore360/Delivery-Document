 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 	
svb_mdsdb.change_request_final src
JOIN  svb_mdwdb.f_change_request  trgt
on  trgt.ROW_ID = src.SYS_ID and src.sourceinstance=trgt.source_id
join svb_mdwdb.d_lov lkp
on COALESCE(CONCAT('STATE','~','CHANGE_REQUEST','~','~','~',UPPER(src.u_change_state)),'UNSPECIFIED')=lkp.row_id
where  coalesce(lkp.row_key, case when src.u_change_state is null then 0 else -1 end ) <>trgt.STATE_src_key
 )c
