select 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_infra_c.infra_eos_score' ELSE 'SUCCESS' END as Message
 from truist_mdwdb.f_application_infra_c 
 where CASE WHEN db_end_of_support_health_code='White' and ws_end_of_support_health_code='White' and os_end_of_support_health_code='White' 
then 'White'
WHEN db_end_of_support_health_code='Red' or ws_end_of_support_health_code='Red' or os_end_of_support_health_code='Red' 
then 'Red'
WHEN db_end_of_support_health_code='Orange' or ws_end_of_support_health_code='Orange' or os_end_of_support_health_code='Orange'
and(db_end_of_support_health_code <> 'Red'  or os_end_of_support_health_code <> 'Red' or db_end_of_support_health_code<>'Red')  then 'Orange' 
WHEN db_end_of_support_health_code='Yellow' or ws_end_of_support_health_code='Yellow' or os_end_of_support_health_code='Yellow'
and(db_end_of_support_health_code not in ('Red','Orange')  or os_end_of_support_health_code not in ('Red','Orange')  
or db_end_of_support_health_code not in ('Red','Orange') )  
then 'Yellow' 
WHEN db_end_of_support_health_code='Green' or ws_end_of_support_health_code='Green' or os_end_of_support_health_code='Green'
and(db_end_of_support_health_code not in ('Red','Orange','Yellow')  or os_end_of_support_health_code not in ('Red','Orange','Yellow')
 or db_end_of_support_health_code not in ('Red','Orange','Yellow'))  
then 'Green' ELSE NULL end <>infra_eos_score;