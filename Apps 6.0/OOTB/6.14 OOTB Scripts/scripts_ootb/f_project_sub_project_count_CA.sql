SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from     #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from    #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (SELECT 
            d_project.top_project_key AS top_project_key, d_project1.top_project_key as row_key,
            COUNT(d_project.top_project_key) AS itd_subproj,
            SUM(CASE 
                WHEN d_project.is_ytd_flag='Y' THEN 1 
                ELSE 0 
            END) AS ytd_subproj
                    FROM
            #DWH_TABLE_SCHEMA.d_project d_project      
        INNER JOIN
            #DWH_TABLE_SCHEMA.d_project d_project1 
                ON d_project.row_key=d_project1.row_key    
        WHERE
            d_project.top_project_key <> d_project.row_key    
        GROUP BY
            1)LKP
ON TRGT.row_key=LKP.row_key
WHERE COALESCE(LKP.itd_subproj,0)<>COALESCE(TRGT.sub_project_count,0)



