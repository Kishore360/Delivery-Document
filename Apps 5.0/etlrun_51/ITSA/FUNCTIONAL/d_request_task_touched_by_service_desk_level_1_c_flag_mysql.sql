SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
 ELSE 'Data Matched' END AS Message 
 FROM (
select count(1) as cnt from wow_mdwdb.d_request_task trg
join (select documentkey,sourceinstance from wow_mdsdb.sys_audit_final 
 where fieldname='assignment_group' and tablename='sc_task' and
  (newvalue = '22f563d20fd0310066e76ab8b1050e63'
  or oldvalue = '22f563d20fd0310066e76ab8b1050e63')
  union 
 select sys_id as documentkey, sourceinstance 
 from wow_mdsdb.sc_task_final where assignment_group='22f563d20fd0310066e76ab8b1050e63'
) temp
  on trg.row_id=temp.documentkey and trg.source_id=temp.sourceinstance and trg.soft_deleted_flag='N'
where trg.touched_by_service_desk_level_1_c_flag <> 'Y')a