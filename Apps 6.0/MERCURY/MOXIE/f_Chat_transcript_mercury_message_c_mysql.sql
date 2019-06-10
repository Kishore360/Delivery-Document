

SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from mercury_mdsdb.us_mercury_transcript_final  a
left join mercury_mdwdb.f_chat_transcript f on concat('MERCURY~',a.row_id)=f.row_id
where coalesce(a.message,'UNSPECIFIED')<>f.message_c )a 

;
