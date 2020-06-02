SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from     #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from    #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
and TRGT.source_id = SRC.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_lov)LKP
on LKP.dimension_class = 'WH_PROJECT~WEEK_BUCKET~TO_DUE_DATE' 
and COALESCE(TRGT.weeks_to_due_date,0)>=LKP.lower_range_value
and COALESCE(TRGT.weeks_to_due_date,0) < LKP.upper_range_value
LEFT JOIN(select * from  #DWH_TABLE_SCHEMA.d_lov_map)MAP
on TRGT.project_state_src_key=MAP.src_key
and TRGT.source_id=MAP.source_id
WHERE MAP.dimension_wh_code not in ('CLOSED') 
and COALESCE(LKP.row_key,CASE WHEN TRGT.weeks_to_due_date IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.weeks_to_due_date_bucket_key,'0')  