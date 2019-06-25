


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
			
 from
            mcdonalds_mdsdb.label_entry_final   led
		LEFT JOIN
            mcdonalds_mdsdb.label_final  lf
                ON led.label = lf.sys_id 
		LEFT OUTER JOIN mcdonalds_mdsdb.task_final t ON led.table_key = t.sys_id
               join mcdonalds_mdwdb.f_task_tag_c f on led.sys_id=f.row_id
		where  upper(t.sys_class_name)  ='PROBLEM' and  CONVERT_TZ(led.sys_created_on,'GMT','America/Los_Angeles') <>pivot_date
		