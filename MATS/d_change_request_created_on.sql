SELECT SRC.sourceinstance, TRGT.source_id ,SRC.cab_date, created_on
,COALESCE(CONVERT_TZ(SRC.sys_created_on,"GMT","America/Los_Angeles"),''),
SRC.sys_created_on
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 LEFT JOIN rei_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where COALESCE(CONVERT_TZ(SRC.sys_created_on,<<source_time_zone>>,<<target_time_zone>>),'')
<> TRGT.created_on;