SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_project.health_score' ELSE 'SUCCESS' END as Message
from azure_build_definition_final jf  left join (SELECT healthReport_f
inal.definitionKey definitionKey,healthReport_final.score FROM #MDS_TABLE_SCHEMA.healthReport_final 
LEFT JOIN azure_build_definition_final ON 
(healthReport_final.definitionKey = azure_build_definition_final.__numerify_row_key and
 healthReport_final.description like 'azure_build_final%Stability%')) SRC
  on jf.__numerify_row_key=SRC.definitionKey
left join #DWH_TABLE_SCHEMA.d_build_project TRG
on (concat(SRC.definitionKey," ") = TRG.row_id)

WHERE COALESCE(SRC.score,'')<> COALESCE(TRG.health_score,'');
