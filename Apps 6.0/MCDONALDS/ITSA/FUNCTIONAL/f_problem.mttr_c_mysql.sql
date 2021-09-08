SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_problem.mttr_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from  mcd_mdsdb.problem_final  src 
left join (SELECT documentkey,sourceinstance,convert_tz(max(sys_created_on),'GMT','US/Central')
  as completed_on from mcd_mdsdb.sys_audit_final WHERE tablename = 'problem' and fieldname = 'u_rca_status' and newvalue = 'Complete'
group by 1,2) lkp on src.sys_id = lkp.documentkey and src.sourceinstance = lkp.sourceinstance
left join mcd_mdwdb.f_problem trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  (case when src.u_rca_status = 'Complete' then (case when TIMESTAMPDIFF(SECOND,trgt.created_on,lkp.completed_on) >=0 
then TIMESTAMPDIFF(SECOND,trgt.created_on,lkp.completed_on) else null end) else null end ) <> trgt.mttr_c) temp;