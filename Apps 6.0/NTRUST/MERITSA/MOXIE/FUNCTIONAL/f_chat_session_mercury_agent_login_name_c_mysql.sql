
SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log_c.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from mercury_mdsdb.mox_mercury_session_details_final  a
left join mercury_mdwdb.f_chat_session_c f on concat('mercury~',a.row_id)=f.row_id
where 
coalesce(a.agent_login_name,'UNSPECIFIED')<>f.agent_login_name_c )a;
