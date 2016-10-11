SELECT CASE
			   WHEN count(1) > 0 THEN 'FAILURE'
			   ELSE 'SUCCESS'
		   END AS RESULT,
		   CASE
			   WHEN count(1) >0 THEN 'Failure'
			   ELSE 'Data Matched'
		   END AS Message
	FROM
(select sys_id,variable_set,description,question_text,variable_name,cat_item,name,reference 
from svb_mdsdb.item_option_new_final
where name = 'user_manager')e
JOIN svb_mdsdb.sc_item_option_final b on b.item_option_new=e.sys_id
inner join svb_mdsdb.sc_item_option_mtom_final d
on d.sc_item_option=b.sys_id
inner join svb_mdwdb.d_request_item c
on d.request_item=c.row_id and c.source_id=d.sourceinstance
inner join svb_mdwdb.d_internal_contact f on concat('INTERNAL_CONTACT~',b.value)=f.row_id 
and b.sourceinstance=f.source_id
inner join  svb_mdwdb.f_request_item_variable_c a 
on SUBSTRING(a.row_id,1,32)= b.sys_id
AND SUBSTRING(a.row_id,34,32)=  d.request_item
AND a.source_id=b.sourceinstance
WHERE f.row_key <>a.user_manager_c_key;
