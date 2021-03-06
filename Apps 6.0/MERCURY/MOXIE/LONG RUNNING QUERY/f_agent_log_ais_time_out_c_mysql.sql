
SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log_c.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from mercury_mdsdb.mox_ais_agent_report_final  a
left join mercury_mdwdb.f_agent_log_c f on concat('AIS~',a.row_id)=f.row_id
where str_to_date(Time_out,'%m/%d/%Y %h:%i:%s %p')<>f.time_out_c )a
;
