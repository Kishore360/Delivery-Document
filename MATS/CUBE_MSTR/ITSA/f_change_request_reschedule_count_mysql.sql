

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reschedule_flag' ELSE 'SUCCESS' END as Message
 FROM 
 (SELECT COALESCE(TA.reschedule_count, 0) AS reschedule_count, 
               SRC.sys_id, 
               SRC.sourceinstance 
        FROM   <<tenant>>_mdsdb.change_request_final SRC 
               LEFT JOIN (SELECT TA.documentkey, 
                                 TA.sourceinstance, 
                                 Count(1) AS reschedule_count 
                          FROM   <<tenant>>_mdsdb.sys_audit_final TA 
                          WHERE  TA.tablename = 'change_request' 
                                 AND TA.fieldname = 'end_date' 
                          GROUP  BY TA.documentkey, 
                                    TA.sourceinstance) TA 
                      ON TA.documentkey = SRC.sys_id 
                         AND TA.sourceinstance = SRC.sourceinstance) FSRC 
       LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
              ON ( FSRC.sys_id = TRGT.row_id 
                   AND FSRC.sourceinstance = TRGT.source_id ) 
WHERE  FSRC.reschedule_count <> TRGT.reschedule_count 

