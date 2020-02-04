SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_raise_impact_c' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.incident_final SRC
JOIN fidelity_mdwdb.d_incident trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
WHERE CASE 
                    WHEN (SRC.impact=1) THEN '1H'    
                    WHEN (SRC.impact=2) THEN '2H'    
                    WHEN (SRC.impact=3) THEN '3H'    
                    WHEN (SRC.impact=4 
                    and SRC.urgency=1 
                    and SRC.u_impacted_audience in ('Both',
                    'External',
                    'Internal')) THEN '4H with BI' 
                    WHEN (SRC.impact=4 
                    and SRC.urgency=1 
                    and (SRC.u_impacted_audience is null 
                    or SRC.u_impacted_audience='None' )) THEN '4H'  
                    WHEN (SRC.impact=4 
                    and SRC.urgency=2 
                    and SRC.u_impacted_audience in ('Both',
                    'External',
                    'Internal')) THEN '4M with BI' 
                    WHEN (SRC.impact=4 
                    and SRC.urgency=2 
                    and (SRC.u_impacted_audience is null 
                    or SRC.u_impacted_audience='None' )) THEN '4M'     
                    WHEN (SRC.impact=4 
                    and SRC.urgency=3 
                    and SRC.u_impacted_audience in ('Both',
                    'External',
                    'Internal')) THEN '4L with BI' 
                    WHEN (SRC.impact=4 
                    and SRC.urgency=3 
                    and (SRC.u_impacted_audience is null 
                    or SRC.u_impacted_audience='None' )) THEN '4L'  
                end <>trgt1.impact_abbreviation_c



