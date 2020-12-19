SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
rogers6_mdwdb.f_nct_ticket_c a 
 JOIN (                  
 SELECT
            d_com_impact_c.RELATED_ID AS nct_id,
            d_com_impact_c.sourceinstance,
            SUM(d_com_impact_c.IMPACT_COUNT * (d_com_impact_c.IMPACT_DURATION_MINUTES/60.0)) AS planned
            
        FROM
            rogers6_mdsdb.bmc_com_impact_final d_com_impact_c         
        WHERE
          
             d_com_impact_c.cdctype ='X'    
        GROUP BY
            1 ,2   )b
ON a.row_id = b.nct_id and a.source_id = b.sourceinstance 
where round(a.customer_impact_planned_total_duration_c,3)
 <>round(planned,3)