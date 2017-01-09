 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed'  ELSE 'SUCCESS' END as Message

from
(
SELECT  count(1) as cnt from   intuit_mdwdb.d_change_task_c dct
   JOIN 
	(
	SELECT saf.documentkey, saf.sys_created_on as sys_created_on
    FROM  intuit_mdsdb.sys_audit_final saf
    JOIN ( 
		SELECT documentkey,max(cdctime) as cdctime
		FROM intuit_mdsdb.sys_audit_final b 
		WHERE  b.tablename='change_task' AND b.fieldname='assigned_to' AND b.oldvalue IS NULL 
		group by 1
		) latest ON saf.documentkey = latest.documentkey and saf.cdctime = latest.cdctime
        
	 WHERE  saf.tablename='change_task' AND saf.fieldname='assigned_to' AND saf.oldvalue IS NULL 
     group by 1
	) tmp ON dct.row_id = tmp.documentkey 
WHERE
    dct.time_to_assign_change_task <>
	COALESCE(CONVERT_TZ(tmp.sys_created_on,'GMT','America/Los_Angeles'),dct.created_on))a;