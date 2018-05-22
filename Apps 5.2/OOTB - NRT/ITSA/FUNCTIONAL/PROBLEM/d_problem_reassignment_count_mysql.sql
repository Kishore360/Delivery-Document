SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
FROM (select * from <<tenant>>_mdsdb.problem_final where cdctype<>'D') s
left join <<tenant>>_mdwdb.d_problem t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and s.reassignment_count <> t.reassignment_count
) temp


