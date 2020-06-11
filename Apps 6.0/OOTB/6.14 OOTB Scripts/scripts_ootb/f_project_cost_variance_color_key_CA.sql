SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.cost_variance_color_key' ELSE 'SUCCESS' END as Message
FROM (select * from   #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN   #DWH_TABLE_SCHEMA.d_lov LKP 
ON coalesce(TRGT.cost_variance,0) BETWEEN LKP.lower_range_value AND LKP.upper_range_value
AND LKP.dimension_class = 'WH_PROJECT~COLOR~COST_VARIANCE'
left join  #DWH_TABLE_SCHEMA.d_lov_map d_lov_map 
            ON d_lov_map.src_key=TRGT.project_state_src_key 
            AND TRGT.source_id=d_lov_map.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN TRGT.cost_variance IS NULL THEN 0 else '-1' end)<>COALESCE(TRGT.cost_variance_color_key,'')