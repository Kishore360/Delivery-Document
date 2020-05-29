SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_project.build_final_stability_score' ELSE 'SUCCESS' END as Message
 from (SELECT health_report.__numerify__parent_key,health_report.score,health_report.__numerify_row_key FROM #MDS_TABLE_SCHEMA.healthReport_final as health_report 
LEFT JOIN #MDS_TABLE_SCHEMA.build_final as build ON 
(health_report.__numerify__parent_key = build.__numerify__primary_key and health_report.description like 'build_final%Stability%')) SRC
 on (concat(SRC.__numerify__primary_key,'') = TRG.row_id)

WHERE COALESCE(SRC.score,'')<> COALESCE(TRG.build_stability_score,'');