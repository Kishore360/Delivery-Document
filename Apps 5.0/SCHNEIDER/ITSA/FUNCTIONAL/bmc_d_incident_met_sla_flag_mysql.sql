SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.met_sla_flag' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC 
JOIN schneider_mdwdb.d_incident di ON (SRC.entry_id = di.row_id AND SRC.sourceinstance = di.source_id AND SRC.sourceinstance = di.source_id )
 where (case 
                when SRC.slm_status is null then 'X' 
                when SRC.slm_status in (3.00,
                4.00) then 'N'  
                else 'Y' 
            end ) <> di.met_sla_flag;
