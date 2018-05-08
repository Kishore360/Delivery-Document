SELECT
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0  THEN 'MDS to DWH data validation failed for f_incident_backlog_aggregator_weekly_c' ELSE 'SUCCESS' END as Message 
FROM (select count(1) cnt from 
                tjx_mdsdb.sys_journal_field_final as sjf 
INNER JOIN tjx_mdsdb.u_customer_service_final AS cs on sjf.element_id = cs.sys_id AND sjf.sourceinstance = cs.sourceinstance
 join tjx_mdwdb.d_customer_service_c d on cs.sys_id=d.row_id and cs.sourceinstance=d.source_id
 join tjx_mdwdb.f_customer_service_c jf on d.row_key=jf.customer_service_c_key
join tjx_mdwdb.d_customer_service_journal_c jd on sjf.sys_id=jd.row_id and sjf.sourceinstance=jd.source_id
WHERE sjf.name = 'task'
                AND sjf.element = 'work_notes' 
                AND cs.sys_class_name = 'u_customer_service'  and
				jf.customer_service_c_key<>jd.customer_service_c_key)a;


		