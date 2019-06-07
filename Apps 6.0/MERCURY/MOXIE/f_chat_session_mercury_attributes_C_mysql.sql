SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from mercuryins_mdsdb.us_mercury_session_details_final  a
left join mercuryins_mdwdb.f_chat_session f on concat('MERCURY~',a.row_id)=f.row_id
where coalesce(a.session_id,'UNSPECIFIED')<>f.chat_session_id or
 coalesce( a.status,'UNSPECIFIED')<>f.status or str_to_date(start_time,'%m/%d/%Y %h:%i:%s %p')<>f.start_time_c or str_to_date(end_time,'%m/%d/%Y %h:%i:%s %p')<>f.end_time_c
or coalesce(a.subject,'UNSPECIFIED')<>f.subject_c or coalesce(a.service_line,'UNSPECIFIED')<>f.service_line_c
or coalesce(a.customer_name,'UNSPECIFIED')<>f.customer_name_c or 
coalesce(a.customer_email,'UNSPECIFIED')<>f.customer_email_c or
coalesce(a.agent_login_name,'UNSPECIFIED')<>f.agent_login_name_c or coalesce(a.disposition_code,'UNSPECIFIED')<>f.dispostion_code_c
or coalesce(a.department,'UNSPECIFIED')<>f.department_c or 
timestampdiff(second,str_to_date(start_time,'%d/%m/%Y %h:%i:%s %p'),str_to_date(end_time,'%d/%m/%Y %h:%i:%s %p'))<>f.actual_chat_duration_c or
timestampdiff(second,str_to_date(end_time,'%d/%m/%Y %h:%i:%s %p'),str_to_date(a.chat_wrap_up_time,'%d/%m/%Y %h:%i:%s %p'))<>f.chat_wrap_up_time_c
 )a