SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_project.inqueue_flag' ELSE 'SUCCESS' END as Message
from

#MDS_TABLE_SCHEMA.azure_build_definition_final SRC 
left join 
(select definitionKey, __numerify__primary_key,sourceinstance,queueTime,status,result from #MDS_TABLE_SCHEMA.azure_build_final 
 where (definitionKey, queueTime) IN (select definitionKey,max(queueTime) 
                                      from #MDS_TABLE_SCHEMA.azure_build_final group by definitionKey)
)last_build 
ON  SRC.__numerify__primary_key = last_build.definitionKey and SRC.sourceinstance = last_build.sourceinstance
left join #DWH_TABLE_SCHEMA.d_build_project TRGT
on  SRC.__numerify__primary_key=TRGT.row_id and SRC.sourceinstance=TRGT.source_id 
left join #DWH_TABLE_SCHEMA.d_build_run LKP
ON last_build.__numerify__primary_key = LKP.row_id and SRC.sourceinstance = LKP.source_id 
left join #DWH_TABLE_SCHEMA.d_lov_map sts
on concat('STATE~BUILD~',last_build.status) = sts.src_rowid and last_build.sourceinstance=sts.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map rslt
on concat('RESULT~BUILD~',last_build.result) = rslt.src_rowid and last_build.sourceinstance=rslt.source_id
WHERE COALESCE(case when  sts.dimension_wh_code = 'NEW' or rslt.dimension_wh_code = 'NOT EXECUTED' then 'Y' else 'N' end,'N')
<> COALESCE(TRGT.inqueue_flag,'');