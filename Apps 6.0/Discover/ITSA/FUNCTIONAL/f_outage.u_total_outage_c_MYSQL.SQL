SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_outage.u_total_outage_c' ELSE 'SUCCESS' END as Message FROM discover_mdsdb.cmdb_ci_outage_final  SRC JOIN discover_mdwdb.f_outage TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE case when SRC.u_total_outage is null then null 
when   TIMESTAMPDIFF(SECOND,
                    '1970-01-01 00:00:00',
                    SRC.u_total_outage) < 0 THEN NULL    
                    ELSE TIMESTAMPDIFF(SECOND,
                    '1970-01-01 00:00:00',SRC.u_total_outage) end <> (TRGT.u_total_outage_c) 


