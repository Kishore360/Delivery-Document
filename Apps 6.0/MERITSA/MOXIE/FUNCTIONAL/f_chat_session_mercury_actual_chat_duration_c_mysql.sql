
SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log_c.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from mercury_mdsdb.mox_mercury_session_details_final  a
left join mercury_mdwdb.f_chat_session_c f on concat('MERCURY~',a.row_id)=f.row_id
where  
timestampdiff(second,str_to_date(start_time,'%d/%m/%Y %h:%i:%s %p'),str_to_date(end_time,'%d/%m/%Y %h:%i:%s %p'))<>f.actual_chat_duration_c )a;


