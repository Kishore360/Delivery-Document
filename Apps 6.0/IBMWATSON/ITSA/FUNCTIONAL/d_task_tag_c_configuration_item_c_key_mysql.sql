
SELECT case WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 case WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
/*select led.cdctype,led.sys_id,cmdb_ci,coalesce(d.row_key,case when cmdb_ci is null then 0 else -1 end) ,configuration_item_c_key*/
FROM  
 
            ibmwatson_mdsdb.label_entry_final   led
		LEFT JOIN
            ibmwatson_mdsdb.label_final  lf
                ON led.label = lf.sys_id  and led.sourceinstance=2
		 JOIN  ibmwatson_mdsdb.task_final t ON led.table_key = t.sys_id and t.sourceinstance=2 and upper(t.sys_class_name)  ='incident'
        left join ibmwatson_mdwdb.d_configuration_item d on  t.cmdb_ci=d.row_id and d.source_id=2
        join   ibmwatson_mdwdb.d_task_tag_c f on led.sys_id=f.row_id and lf.sourceinstance=f.source_id 
		where led.cdctype<>'D' and -- upper(t.sys_class_name)  ='request_task' and 
		coalesce(d.row_key,case when cmdb_ci is null then 0 else -1 end) <>configuration_item_c_key;
		
		