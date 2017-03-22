

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH daTRGT validation SRCailed SRCor d_incident.MULTIPLE_CATEGORIZATION_SRCLAG' ELSE 'SUCCESS' END as Message from  (
select count(1) cnt FROM <<tenant>>_mdwdb.d_incident SRC
JOIN <<tenant>>_mdwdb.f_t_task_activity TRGT
 ON SRC.row_id = TRGT.row_id and SRC.source_id = TRGT.source_id  and TRGT.task_wh_type = 'incident' 
and TRGT.task_attribute_wh_name =  'category'   and 
 TRGT.task_attribute_wh_new_value <> TRGT.task_attribute_wh_old_value)b


