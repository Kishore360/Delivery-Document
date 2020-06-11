SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_project.health_score' ELSE 'SUCCESS' END as Message
from job_final jf  left join (SELECT healthReport_f
inal.__numerify__parent_key __numerify__parent_key,healthReport_final.score FROM #MDS_TABLE_SCHEMA.healthReport_final 
LEFT JOIN job_final ON 
(healthReport_final.__numerify__parent_key = job_final.__numerify_row_key and
 healthReport_final.description like 'build_final%Stability%')) SRC
  on jf.__numerify_row_key=SRC.__numerify__parent_key
left join #DWH_TABLE_SCHEMA.d_build_project TRG
on (concat(SRC.__numerify__parent_key," ") = TRG.row_id)

WHERE COALESCE(SRC.score,'')<> COALESCE(TRG.health_score,'');
