SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from mercuryins_mdsdb.us_mercury_transcript_final  a
left join mercuryins_mdwdb.f_chat_transcript f on concat('MERCURY~',a.row_id)=f.row_id
where a.seq_no<>f.seq_no_c or a.origin<>f.origin_c or str_to_date(datetime,'%m/%d/%Y %h:%i:%s %p')<>f.chat_entry_date_time_c
or coalesce(a.message,'UNSPECIFIED')<>f.message_c or a.sessionid<>f.chat_session_id_c )a