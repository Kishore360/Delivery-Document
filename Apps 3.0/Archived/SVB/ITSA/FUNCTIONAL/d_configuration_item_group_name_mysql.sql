SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
 FROM  svb_mdsdb.sys_app_module_final sam 
inner join svb_mdsdb.sys_app_application_final saa 
on sam.application=saa.sys_id and sam.SourceInstance=saa.SourceInstance
and saa.title like '%Configuration%'
JOIN  svb_mdwdb.d_configuration_item_group b
ON sam.sys_id = b.row_id and sam.sourceinstance=b.source_id
where 
sam.name<>b.name)b