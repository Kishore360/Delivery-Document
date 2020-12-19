SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
rogers6_mdwdb.d_nct_ticket_c a 
 JOIN rogers6_mdsdb.bmc_nct_ticket_final b
ON a.row_id = b.nct_id and a.source_id = b.sourceinstance 


where
a.network_impact_c
 <> COALESCE(b.NETWORK_IMPACT,'UNSPECIFIED')