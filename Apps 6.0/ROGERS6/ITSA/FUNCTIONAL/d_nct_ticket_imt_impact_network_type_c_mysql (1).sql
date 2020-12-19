SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
rogers6_mdwdb.d_nct_ticket_c a 
 JOIN (                  SELECT
            SUM(CASE 
                WHEN d_imt_main_c.NETWORK_IMPACT='Outage' THEN 1 
                ELSE 0 
            END) AS outage_cnt,
            SUM(CASE 
                WHEN d_imt_main_c.NETWORK_IMPACT='Degraded' THEN 1 
                ELSE 0 
            END) AS degrade_cnt,
            SUM(CASE 
                WHEN d_imt_main_c.NETWORK_IMPACT='Threatened' THEN 1 
                ELSE 0 
            END) AS threatened_cnt,
            d_nct_ticket_c.nct_id AS nct_id,
            SUM(CASE 
                WHEN d_imt_main_c.NETWORK_IMPACT='None' THEN 1 
                ELSE 0 
            END) AS none_cnt,
            COUNT(d_imt_main_c.imt_id) AS imt_cnt,
            d_nct_ticket_c.sourceinstance     
        FROM
            rogers6_mdsdb.bmc_nct_ticket_final d_nct_ticket_c      
        INNER JOIN
            rogers6_mdsdb.bmc_com_associated_ticket_final d_com_associated_ticket_c 
                ON d_nct_ticket_c.NCT_ID  = d_com_associated_ticket_c.SOURCE_ID 
				and d_nct_ticket_c.sourceinstance = d_com_associated_ticket_c.sourceinstance 				
                and d_com_associated_ticket_c.TICKET_CATEGORY  ='IMT - Cause' 
        INNER JOIN
            rogers6_mdsdb.bmc_imt_main_final d_imt_main_c 
                ON d_com_associated_ticket_c.ASSOCIATED_ID  = d_imt_main_c.IMT_ID  
				and  d_com_associated_ticket_c.sourceinstance  = d_imt_main_c.sourceinstance  
                and CEIL(d_com_associated_ticket_c.status)=0 
         
        WHERE
            d_nct_ticket_c.cdctype ='X' 
            and d_com_associated_ticket_c.cdctype ='X' 
            and d_imt_main_c.cdctype ='X' 
 
        GROUP By
            d_nct_ticket_c.nct_id,d_nct_ticket_c.sourceinstance  )b
ON a.row_id = b.nct_id and a.source_id = b.sourceinstance 


where
a.imt_impact_network_type_c
 <> CASE              
            WHEN b.outage_cnt > 0 THEN 'Outage'               
            WHEN b.degrade_cnt > 0 THEN 'Degraded'              
            WHEN b.threatened_cnt > 0 THEN 'Threatened'              
            WHEN b.imt_cnt = b.none_cnt THEN 'None'               
            ELSE 'UNSPECIFIED'          
        END 