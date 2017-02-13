SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM
(SELECT count(1) as cnt from 
cardinalhealth_mdsdb.rm_enhancement_final SRC
join cardinalhealth_mdwdb.f_enhancement_rm TRGT 
on SRC.sys_id =TRGT.row_id and SRC.sourceinstance = TRGT.source_id
JOIN cardinalhealth_mdwdb.d_lov_map br 
ON TRGT.status_rm_src_c_key= br.src_key AND br.dimension_wh_code IN ('CLOSED') 
JOIN cardinalhealth_mdwdb.d_enhancement_rm_c d_enhancement_rm_c 
ON TRGT.enhancement_c_key = d_enhancement_rm_c.row_key
WHERE TRGT.no_of_times_due_date_changed_c <> (SELECT count(1)
	   FROM cardinalhealth_mdwdb.f_rm_activity_c
	   WHERE task_wh_type = 'rm_enhancement'
	   AND task_attribute_wh_name = 'due_date'
	   AND enhancement_c_key=TRGT.enhancement_c_key
	   AND created_on between d_enhancement_rm_c.opened_date AND d_enhancement_rm_c.closed_date))a