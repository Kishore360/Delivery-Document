
SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from mercury_mdsdb.us_ais_session_details_final  a
left join mercury_mdwdb.f_chat_session f on concat('AIS~',a.row_id)=f.row_id
where    str_to_date(end_time,'%m/%d/%Y %h:%i:%s %p')<>f.end_time_c)a ;


