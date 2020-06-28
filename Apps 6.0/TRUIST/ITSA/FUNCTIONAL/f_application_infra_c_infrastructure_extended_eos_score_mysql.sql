select 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_infra_c.infrastructure_extended_eos_score' ELSE 'SUCCESS' END as Message
 from truist_mdwdb.f_application_infra_c 
 where CASE WHEN db_extended_end_of_support_health='WHITE' and ws_extended_end_of_support_health='WHITE' and os_extended_end_of_support_health='WHITE' 
then 'WHITE'
WHEN db_extended_end_of_support_health='RED' or ws_extended_end_of_support_health='RED' or os_extended_end_of_support_health='RED' 
then 'RED'
WHEN db_extended_end_of_support_health='YELLOW' or ws_extended_end_of_support_health='YELLOW' or os_extended_end_of_support_health='YELLOW'
and(db_extended_end_of_support_health not in ('RED')  or os_extended_end_of_support_health not in ('RED') or db_extended_end_of_support_health not in ('RED') )  
then 'YELLOW' 
WHEN db_extended_end_of_support_health='GREEN' or ws_extended_end_of_support_health='GREEN' or os_extended_end_of_support_health='GREEN'
and(db_extended_end_of_support_health not in ('RED','YELLOW')  or os_extended_end_of_support_health not in ('RED','YELLOW')
 or db_extended_end_of_support_health not in ('RED','YELLOW'))  
then 'GREEN' ELSE NULL end <>infrastructure_extended_eos_score;