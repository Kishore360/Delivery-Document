SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.fm_expense_line_final a
 join paloalto_mdwdb.d_expense_item b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where COALESCE(a.short_description,
                'UNSPECIFIED')<>b.short_desc;
				
				