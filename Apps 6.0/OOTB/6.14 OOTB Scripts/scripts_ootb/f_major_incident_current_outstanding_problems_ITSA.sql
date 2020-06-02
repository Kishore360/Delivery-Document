SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident.current_outstanding_problems' ELSE 'current_outstanding_problems-SUCCESS' END as Message
 from 
(
select 
c_apl.sys_id,
d_apl.row_key as application_key,
coalesce(pb.prob_cnt,0) as current_outstanding_problems

from #MDS_TABLE_SCHEMA.cmdb_ci_appl_final c_apl
left join #DWH_TABLE_SCHEMA.d_application d_apl
on coalesce(concat('APPLICATION~',c_apl.sys_id),'UNSPECIFIED')=d_apl.row_id
left join (
select cmdb_ci,sourceinstance, count(sys_id) as prob_cnt
from  #MDS_TABLE_SCHEMA.problem_final prob
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('STATE','~','PROBLEM','~',upper(problem_state)) = LKP.src_rowid 
AND prob.sourceinstance = LKP.source_id )
where LKP.dimension_wh_code='OPEN' and prob.cdctype<>'D'
group by 1,2
)pb
on 
(coalesce(pb.cmdb_ci, 0)=coalesce(c_apl.sys_id,0)
and pb.sourceinstance=c_apl.sourceinstance)
where  c_apl.sourceinstance=2
)SRC

left join #DWH_TABLE_SCHEMA.f_major_incident trgt
on SRC.sys_id=trgt.row_id
where SRC.current_outstanding_problems<>trgt.current_outstanding_problems;