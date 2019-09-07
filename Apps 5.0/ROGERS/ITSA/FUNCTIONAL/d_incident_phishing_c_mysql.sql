SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_incident.groups_for_rca_c' ELSE 'SUCCESS' END as Message
 FROM rogers_mdsdb.incident_final  SRC left JOIN rogers_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE
case  when  SRC.description like '%Spam%' or SRC.description like '%Phish%' or SRC.description like '%Phishing@rci.rogers.com%' 
or SRC.description like '%scam%' or SRC.description like '%spyware%' or  SRC.short_description like '%Spam%' 
or SRC.short_description like '%Phish%' or SRC.short_description like '%Phishing@rci.rogers.com%'  
or  SRC.short_description like '%scam%' or SRC.short_description like '%spyware%'   
or SRC.close_notes like '%Spam%' or SRC.close_notes like '%Phish%' or SRC.close_notes like '%Phishing@rci.rogers.com%'  
or  SRC.close_notes like '%scam%' or SRC.close_notes like '%spyware%'  or  
SRC.close_code ='Phishing' or SRC.u_knowledge_record = 'ff61a82d4f0bf500cdae00fe9310c7ec' then 'Y' else 'N'  end <> phishing_c
and SRC.CDCTYPE='X';

