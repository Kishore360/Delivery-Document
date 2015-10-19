
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from  (
select count(1) as cnt 
from 
intuit_mdsdb.problem_final  SRC
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=SRC.sys_id   and SRC.SourceInstance =TRG.source_id
left join  intuit_mdwdb.d_calendar_date cal_sd 
on cal_sd.row_id=COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.u_post_mortem_schedule_date,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') 
 and cal_sd.source_id=0
where TRG.post_mortem_schedule_c_key <> coalesce(cal_sd.row_key,-1)) temp