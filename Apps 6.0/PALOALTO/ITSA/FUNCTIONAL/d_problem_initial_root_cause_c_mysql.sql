SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM ( select b.u_problem,b.u_initial_root_cause,sourceinstance from(select u_problem,max(sys_updated_on) m_sys_updated_on from paloalto_mdsdb.u_initial_findings_final  group by 1) a
join paloalto_mdsdb.u_initial_findings_final b
on a.u_problem=b.u_problem and b.sys_updated_on=a.m_sys_updated_on) c
 join paloalto_mdwdb.d_problem d
 on c.u_problem=d.row_id and c.sourceinstance=d.source_id
 where COALESCE(c.u_initial_root_cause,'UNSPECIFIED')<>d.initial_root_cause_c;