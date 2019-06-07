SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from mercuryins_mdsdb.us_mercury_agent_report_final  a
left join mercuryins_mdwdb.f_agent_log f on concat('MERCURY~',a.row_id)=f.row_id
where a.Agent<>f.agent_c or str_to_date(Time_in,'%m/%d/%Y %h:%i:%s %p')<>f.time_in_c or str_to_date(Time_out,'%m/%d/%Y %h:%i:%s %p')<>f.time_out_c
or a.Status_code<>f.Status_code_c or a.Department<>f.Department_c )a;