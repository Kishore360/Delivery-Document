SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_project.first_build_run_key' ELSE 'SUCCESS' END as Message
from 
#MDS_TABLE_SCHEMA.azure_build_definition_final SRC 
left join 
(select definitionKey, __numerify__primary_key,sourceinstance,starttime from #MDS_TABLE_SCHEMA.azure_build_final 
 where (definitionKey, starttime) IN (select definitionKey,min(starttime) 
                                      from #MDS_TABLE_SCHEMA.azure_build_final group by definitionKey)
) first_build 
ON  SRC.__numerify__primary_key = first_build.definitionKey and SRC.sourceinstance = first_build.sourceinstance
left join #DWH_TABLE_SCHEMA.d_build_project TRG
on  SRC.__numerify__primary_key=TRG.row_id and SRC.sourceinstance=TRG.source_id 
left join #DWH_TABLE_SCHEMA.d_build_run LKP
ON first_build.__numerify__primary_key = LKP.row_id and SRC.sourceinstance = LKP.source_id 
WHERE COALESCE(LKP.row_key,case when LKP.row_key is null then 0 else -1 end) <> COALESCE(TRG.first_build_run_key,'');

