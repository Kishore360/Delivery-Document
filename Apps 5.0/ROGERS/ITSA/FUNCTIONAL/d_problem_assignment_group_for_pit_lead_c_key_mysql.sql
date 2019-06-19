SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0
 THEN 'MDS to DWH data validation failed for d_problem.assignment_group_for_pit_lead_c_key' ELSE 'SUCCESS' END as Message 
 FROM (
select count(1) cnt
from (select SRC.sourceinstance,SRC.u_assignment_group_for_pit_lead u_assignment_group_for_pit_lead,TRGT.assignment_group_for_pit_lead_c_key,source_id source_id
fROM rogers_mdsdb.problem_final  SRC 
JOIN rogers_mdwdb.d_problem TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 

  ) a
left join ( select right(row_id,32) row_id,row_key from rogers_mdwdb.d_internal_organization    ) LKP
 on a.u_assignment_group_for_pit_lead=LKP.row_id and a.sourceinstance = a.source_id
WHERE 
 COALESCE(LKP.row_key,CASE WHEN a.u_assignment_group_for_pit_lead IS NULL THEN 0 else -1 end) <> (a.assignment_group_for_pit_lead_c_key) )a;