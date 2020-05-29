SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.actual_end_on_numerify' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
 LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov  LKP
  on CONCAT('Project_Task~State~',SRC.PROGRESS) = LKP.row_id
 left join  #DWH_TABLE_SCHEMA.d_lov_map MAP
on SRC.sourceinstance = MAP.source_id
and  COALESCE(LKP.row_key,CASE WHEN SRC.PROGRESS IS NULL THEN 0 else '-1' end) = MAP.src_key
where CASE 
            WHEN MAP.dimension_wh_code IN ('IN PROGRESS') THEN   (SELECT
                max(lastupdated) 
            FROM
                 #DWH_TABLE_SCHEMA.d_o_data_freshness 
            WHERE
                source_id =SRC.sourceinstance
                ) 
            ELSE COALESCE(TRGT.ACTUAL_END_ON,'') END <> coalesce(TRGT.actual_end_on_numerify,'')