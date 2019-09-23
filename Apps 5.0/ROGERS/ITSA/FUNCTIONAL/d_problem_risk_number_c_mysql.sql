

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select count(1) cnt from rogers_mdsdb.problem_final s
join rogers_mdwdb.d_problem d on s.sys_id=d.row_id and s.sourceinstance=d.source_id
where case when s.short_description like '%Risk #%' then  substring(s.short_description,instr(s.short_description,'#')+1,3) else 
'UNSPECIFIED' end<>risk_number_c
and s.cdctype='X' 
)a;

