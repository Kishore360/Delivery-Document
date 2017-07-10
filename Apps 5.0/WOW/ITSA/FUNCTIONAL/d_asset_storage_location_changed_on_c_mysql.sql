
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_asset.storage_location_changed_on_c' ELSE 'SUCCESS' END as Message 

FROM wow_mdwdb.d_asset trgt 
RIGHT JOIN wow_mdsdb.alm_asset_final src
on CONCAT('ASSET~',src.sys_id) = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN (SELECT a11.documentkey,MAX(a11.sys_created_on) as sys_created_on,MAX(a11.oldvalue) as oldvalue,MAX(a11.newvalue) as newvalue 
FROM wow_mdsdb.sys_audit_final a11
join (SELECT documentkey,MAX(sys_created_on) as sys_created_on  from wow_mdsdb.sys_audit_final where fieldname = 'stockroom' group by 1) a12
ON a11.documentkey = a12.documentkey and a11.sys_created_on = a12.sys_created_on
where a11.fieldname ='stockroom' GROUP BY 1 ) audit_temp
ON src.sys_id = audit_temp.documentkey
WHERE CONVERT_TZ(audit_temp.sys_created_on,'GMT','US/Central') <> storage_location_changed_on_c
;