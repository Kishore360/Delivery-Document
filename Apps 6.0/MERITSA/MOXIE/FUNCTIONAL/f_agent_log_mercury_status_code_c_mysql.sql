

SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_agent_log_c.agent_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt
 from meritsa_mdsdb.mox_meritsa_agent_report_final  a
left join meritsa_mdwdb.f_agent_log_c f on concat('meritsa~',a.row_id)=f.row_id
where a.Status_code<>f.Status_code_c )a;


