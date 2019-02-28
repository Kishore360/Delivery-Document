SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM tjxco_mdsdb.incident_final src
LEFT JOIN (select distinct value,label,sourceinstance from tjxco_mdsdb.sys_choice_final where name='incident' and element='category' and language ='en') category
ON src.category  = category.value and src.sourceinstance = category.sourceinstance
LEFT JOIN (select distinct value,label,sourceinstance from tjxco_mdsdb.sys_choice_final where name='incident' and element='subcategory' and language ='en')
subcategory
ON src.subcategory =subcategory.value and src.sourceinstance = subcategory.sourceinstance
LEFT JOIN tjxco_mdsdb.cmdb_ci_final cmdb_ci
on src.cmdb_ci = cmdb_ci.sys_id and src.sourceinstance = cmdb_ci.sourceinstance
join
tjxco_mdwdb.d_incident trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where concat (coalesce(category.label,src.category,'UNSPECIFIED'), '>', coalesce(subcategory.label,src.subcategory,'UNSPECIFIED'), '>',coalesce(CASE WHEN cmdb_ci is NULL THEN 'UNSPECIFIED' ELSE  cmdb_ci.name END,'UNKNOWN'))<>trgt.coding_c
) temp;