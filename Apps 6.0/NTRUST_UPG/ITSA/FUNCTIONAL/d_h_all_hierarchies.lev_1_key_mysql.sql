SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'MDS to DWH data validation failed for d_h_all_hierarchies.lev_1_key' ELSE 'SUCCESS' END 
as Message FROM 
        ntrust_mdwdb.d_h_all_hierarchies a   
    INNER JOIN
        ntrust_mdwdb.d_internal_organization b 
            ON CONCAT('SUBSIDIARY~',
        a.lev_1_id) =  b.row_id 
        AND a.source_id = b.source_id 
        AND b.current_flag = 'Y' 
        and b.group_flag = 'Y'  
        AND  a.hierarchy_class = 'ASSIGNMENT GROUP TIER'  
    where 
        a.lev_2_key <> b.row_key  ;  