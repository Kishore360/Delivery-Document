SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0
 THEN 'MDS to DWH data validation failed for d_problem.problem_pit_lead_assignment_group_2_c_key' ELSE 'SUCCESS' END as Message 
 FROM (
select count(1) cnt
from (select SRC.sourceinstance,SRC.u_pit_lead_assignment_group_2 u_pit_lead_assignment_group_2,TRGT.problem_pit_lead_assignment_group_2_c_key,source_id source_id,SRC.cdctype
fROM rogers6_mdsdb.problem_final  SRC 
JOIN rogers6_mdwdb.d_problem TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 

  ) a
left join ( select right(row_id,32) row_id,row_key,soft_deleted_flag from rogers6_mdwdb.d_internal_organization    ) LKP
 on a.u_pit_lead_assignment_group_2=LKP.row_id and a.sourceinstance = a.source_id
WHERE 
 COALESCE(LKP.row_key,CASE WHEN a.u_pit_lead_assignment_group_2 IS NULL THEN 0 else -1 end) <> (a.problem_pit_lead_assignment_group_2_c_key) 
and a.CDCTYPE='X' and LKP.soft_deleted_flag='N')a;