drop table if exists app_test.ds_domain;
create table app_test.ds_domain
SELECT sys_id AS row_id, 
sourceinstance AS source_id ,
	null AS DOMAIN_VALUE ,
	name AS domain_name,
	sys_created_by as created_by ,
	sys_updated_by as changed_by,
	sys_created_on as created_on,
	sys_updated_on as changed_on,
	'Y' AS ACTIVE_FLAG,
	null as domain_type
	FROM <<tenant>>_mdsdb.core_company_final ;
	
	
	
