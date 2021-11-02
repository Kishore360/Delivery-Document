SELECT DISTINCT IFF(1=1,'SUCCESS','FAILURE') AS Result,
IFF(1=1,'SUCCESS','MDS to DWH data validation failed for f_incident_change_summary_c.number_of_incidents_resolved_within_agreed_service_levels_c') as Message
FROM mdw.f_incident_change_summary_c TRGT
WHERE (SELECT COUNT(*)
       FROM mdsdb.hlx_hpd_help_desk_final WHERE Status IN ('Resolved',
                    'Closed')  
                    AND ((Priority='Critical' 
                    AND (CASE 
                        WHEN Last_Resolved_Date IS NOT NULL THEN  timestampdiff(HOUR,
                        to_timestamp(Last_Resolved_Date,
                        'YYYY-MM-DDTHH24:MI:SS.FF0+TZHTZM'),
                        to_timestamp(Submit_Date,
                        'YYYY-MM-DDTHH24:MI:SS.FF0+TZHTZM'))   
                        ELSE NULL  
                    END) < (60*60*4))    
                    OR  (Priority='High' 
                    AND (CASE 
                        WHEN Last_Resolved_Date IS NOT NULL THEN  timestampdiff(HOUR,
                        to_timestamp(Last_Resolved_Date,
                        'YYYY-MM-DDTHH24:MI:SS.FF0+TZHTZM'),
                        to_timestamp(Submit_Date,
                        'YYYY-MM-DDTHH24:MI:SS.FF0+TZHTZM'))   
                        ELSE NULL  
                    END) < (60*60*8))    
                    OR     (Priority='Critical' 
                    AND (CASE 
                        WHEN Last_Resolved_Date IS NOT NULL THEN  timestampdiff(HOUR,
                        to_timestamp(Last_Resolved_Date,
                        'YYYY-MM-DDTHH24:MI:SS.FF0+TZHTZM'),
                        to_timestamp(Submit_Date,
                        'YYYY-MM-DDTHH24:MI:SS.FF0+TZHTZM'))   
                        ELSE NULL  
                    END) < (60*60*72))    
                    OR     (Priority='Critical' 
                    AND (CASE 
                        WHEN Last_Resolved_Date IS NOT NULL THEN  timestampdiff(HOUR,
                        to_timestamp(Last_Resolved_Date,
                        'YYYY-MM-DDTHH24:MI:SS.FF0+TZHTZM'),
                        to_timestamp(Submit_Date,
                        'YYYY-MM-DDTHH24:MI:SS.FF0+TZHTZM'))   
                        ELSE NULL  
                    END) < (60*60*120)))) <> (TRGT.number_of_incidents_resolved_within_agreed_service_levels_c) and TRGT.soft_deleted_flag ='N';