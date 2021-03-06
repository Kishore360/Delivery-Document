SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
			
 from
            mcdonalds_mdsdb.label_entry_final   led
		 JOIN
            mcdonalds_mdsdb.label_final  lf
                ON led.label = lf.sys_id and led.sourceinstance=lf.sourceinstance
		 JOIN mcdonalds_mdsdb.task_final t ON led.table_key = t.sys_id and led.sourceinstance=t.sourceinstance
        left join mcdonalds_mdwdb.d_request_item d on  led.table_key=d.row_id and  led.sourceinstance=d.source_id
        join mcdonalds_mdwdb.f_task_tag_c f on led.sys_id=f.row_id and  led.sourceinstance=f.source_id
		where upper(t.sys_class_name)  ='SC_REQ_ITEM' and d.row_key <>request_item_key
		
		