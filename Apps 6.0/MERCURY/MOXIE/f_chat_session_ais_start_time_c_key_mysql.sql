SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
from mercuryins_mdsdb.us_ais_session_details_final a
left join mercuryins_mdwdb.f_chat_session f on concat('AIS~',a.row_id)=f.row_id 
join  mercuryins_mdwdb.d_calendar_date d on str_to_date(datetime,'%d/%m/%Y')=d.row_id 
where coalesce(d.row_key,case when datetime is null then 0 else -1 end)<>f.start_time_c_key)a;