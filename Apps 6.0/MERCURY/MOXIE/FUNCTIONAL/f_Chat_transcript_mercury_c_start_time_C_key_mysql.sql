SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log_c.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
from mercury_mdsdb.mox_ais_transcript_final a
left join mercury_mdwdb.f_chat_transcript_c f on concat('AIS~',a.row_id)=f.row_id 
join  mercury_mdwdb.d_calendar_date d on str_to_date(datetime,'%Y/%m/%d')=d.row_id 
where coalesce(d.row_key,case when datetime is null then 0 else -1 end)<>f.start_time_c_key)a;