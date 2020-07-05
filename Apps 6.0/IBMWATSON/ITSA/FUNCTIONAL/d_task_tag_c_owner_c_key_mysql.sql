SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message

/*select led.cdctype,upper(t.sys_class_name),owner,coalesce(d.row_key,case when owner is null then 0 else -1 end) ,f.task_tag_owner_c_key*/
FROM     ibmwatson_mdsdb.label_entry_final   led
		LEFT JOIN
            ibmwatson_mdsdb.label_final  lf
                ON led.label = lf.sys_id  and led.sourceinstance=2
		LEFT OUTER JOIN  ibmwatson_mdsdb.task_final t ON led.table_key = t.sys_id and t.sourceinstance=2  
        left join ibmwatson_mdwdb.d_internal_contact d on concat('INTERNAL_CONTACT~',lf.owner)=d.row_id and d.source_id=2
        join    ibmwatson_mdwdb.d_task_tag_c f on led.sys_id=f.row_id and lf.sourceinstance=f.source_id 
		where  led.cdctype<>'D' and   upper(t.sys_class_name)  ='incident'
        and coalesce(d.row_key,case when lf.owner is null then 0 else -1 end) <>f.task_tag_owner_c_key;
		
		
		
		