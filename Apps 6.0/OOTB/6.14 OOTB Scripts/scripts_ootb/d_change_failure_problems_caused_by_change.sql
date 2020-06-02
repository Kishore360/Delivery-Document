SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.problems_caused_by_change' ELSE 'SUCCESS' END as Message
-- select COALESCE(SRC.problem_count,0),COALESCE(TRGT.problems_caused_by_change,'')
from (
select SRC1.sys_id,SRC1.sourceinstance,prob_count.caused_by as CR,prob_count.problem_count,SRC1.state from 
(SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')SRC1
left outer join
( 
select inc.caused_by,inc.sourceinstance as source_id,count(problem_id) as problem_count 
from (select * from #MDS_TABLE_SCHEMA.incident_final where caused_by is not null and problem_id is not null and cdctype<>'D')inc
group by 1,2
) prob_count
on (SRC1.sys_id=prob_count.caused_by 
 AND SRC1.sourceinstance=prob_count.source_id )
) SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999 and current_flag='Y' and soft_deleted_flag='N'
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
 WHERE COALESCE(SRC.problem_count,0)<> COALESCE(TRGT.problems_caused_by_change,'');