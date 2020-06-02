SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC 
 LEFT JOIN  #DWH_TABLE_SCHEMA.f_change_task f
 ON (SRC.task_id=f.row_id 
 AND SRC.sourceinstance=f.source_id )
LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov L  
ON ((FLOOR(f.age/(24*60*60)) BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'WH_AGEBUCKET~CHANGE_TASK' )
WHERE (case when f.age is null then null
     when (f.age is not null and L.row_key is null) then -1
     else L.row_key end )
 <> f.age_key
