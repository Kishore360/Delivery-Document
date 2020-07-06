SELECT case WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 case WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from 
 -- select led.table_key,d.row_id,coalesce(d.row_key,case when table_key is null then 0 else -1 end) ,task_tag_task_c_key FROM
   
ibmwatson_mdsdb.label_entry_final   led
		LEFT JOIN             ibmwatson_mdsdb.label_final  lf                ON led.label = lf.sys_id  and led.sourceinstance=2 and led.cdctype<>'D'
		LEFT OUTER JOIN ibmwatson_mdsdb.task_final t ON led.table_key = t.sys_id and t.sourceinstance=2
        left join ibmwatson_mdwdb.d_task d on  led.table_key=d.row_id and d.source_id=2 and upper(t.sys_class_name)  ='problem'
        join   ibmwatson_mdwdb.d_task_tag_c f on led.sys_id=f.row_id and lf.sourceinstance=f.source_id 
		where   upper(t.sys_class_name)  ='problem' and
        
        coalesce(d.row_key,case when table_key is null then 0 else -1 end) <>task_tag_task_c_key;
		
		
		
		