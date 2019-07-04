

SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log_c.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from meritsa_mdsdb.mox_meritsa_session_details_final  a
left join meritsa_mdwdb.f_chat_session_c f on concat('meritsa~',a.row_id)=f.row_id
where  str_to_date(start_time,'%m/%d/%Y %h:%i:%s %p')<>f.start_time_c )a;

