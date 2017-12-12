SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.changed_on' ELSE 'SUCCESS' END as Message
  FROM
 gogo_mdsdb.wm_order_final b 
join  gogo_mdwdb.f_work_order_c a on a.row_id=b.sys_id and a.source_id=b.sourceinstance
where 
TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_days_remaning) <> days_remaining