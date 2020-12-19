SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
rogers6_mdwdb.d_nct_ticket_c a 
 JOIN (                  SELECT

            GROUP_CONCAT(DISTINCT d_imt_main_c.NETWORK_IMPACT 
        ORDER BY
            d_imt_main_c.NETWORK_IMPACT ASC SEPARATOR ' , ') AS Service_type,
           d_nct_ticket_c.nct_id,
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
a.imt_impact_service_type_c
 <>CASE              
            WHEN b.Service_type = 'None' THEN 'None Only'               
            WHEN b.Service_type = 'Outage' THEN 'Outage Only'              
            WHEN b.Service_type = 'Degraded' THEN 'Degraded Only'              
            WHEN b.Service_type = 'Threatened' THEN 'Threatened Only'              
            ELSE b.Service_type END