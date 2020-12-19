
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
rogers6_mdwdb.f_nct_ticket_c a 
 JOIN (SELECT
            d_com_networkelements_c.RELATED_ID AS nct_id,
			d_com_networkelements_c.sourceinstance,
            SUM(CASE 
                WHEN d_com_networkelements_c.OUN_NUMBER is not NULL THEN 1 
                ELSE 0 
            END) AS oun_not_null,
            SUM(CASE 
                WHEN d_com_networkelements_c.OUN_NUMBER is NULL THEN 1 
                ELSE 0 
            END) AS oun_null    
        FROM
            rogers6_mdsdb.bmc_com_networkelement_final d_com_networkelements_c         
        WHERE
            d_com_networkelements_c.element_type ='Node' 
            and d_com_networkelements_c.status = 0 
            and d_com_networkelements_c.cdctype ='X'    
        GROUP BY
            1   )  b
ON a.row_id = b.nct_id and a.source_id = b.sourceinstance 


where
a.ouns_generated_nodes_c <> b.oun_not_null

           