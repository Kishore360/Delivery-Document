
SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log_c_c.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from mercury_mdsdb.mox_mercury_transcript_final  a
left join mercury_mdwdb.f_chat_transcript_c f on concat('MERCURY~',a.row_id)=f.row_id
where a.sessionid<>f.chat_session_id_c )a
