drop table if exists app_test.ds_internal_organization;
create table app_test.ds_internal_organization
SELECT 
	CONCAT('SUBSIDIARY~',Driver.sys_id) AS ROW_ID,
	Driver.SourceInstance AS SOURCE_ID,
 
	CONCAT('SUBSIDIARY~',cc.parent) AS PARENT_ROW_ID,
	cc.name AS ORGANIZATION_NAME,
	'Y' AS ORGANIZATION_ACTIVE_FLAG,
	NULL AS ORGANIZATION_URL,
	cc.contact AS ORGANIZATION_CONTACT_ID,
	B.Name AS ORGANIZATION_CONTACT_NAME,
	cc.street AS ADDRESS,
	NULL AS LEGAL_NAME,
	cc.fax_phone AS FAX_PHONE_NUMBER,
	NULL AS SUBSIDARY_FISCAL_CALENDAR,
	NULL AS SUBSIDARY_CURRENCY_CODE,
	cc.city AS CITY_CODE,
	NULL AS STATE_CODE,
	cc.zip AS POSTAL_CODE,
	NULL AS COUNTRY_CODE,
	NULL AS CONTINENT_CODE,
	'N' AS DEPARTMENT_FLAG,
	'Y' AS LEGAL_ENTITY_FLAG,
	'N' AS INVENTORY_ORG_FLAG,
	'N' AS SUBSIDIARY_FLAG,
	'N' AS CLASSIFICATION_FLAG,
	'N' AS GROUP_FLAG,
	cc.sys_created_by AS CREATED_BY,
	cc.sys_updated_by AS CHANGED_BY,
	cc.sys_created_on AS CREATED_ON,
	cc.sys_updated_on AS CHANGED_ON
	
    FROM 
	 (SELECT sys_id, sourceinstance
     FROM <<tenant>>_mdsdb.core_company_final
	 UNION
	 SELECT A.sys_id, A.sourceinstance
     FROM <<tenant>>_mdsdb.core_company_final A
	 JOIN <<tenant>>_mdsdb.sys_user_final B ON A.contact = B.sys_id AND A.sourceinstance = B.sourceinstance
	 )Driver
	 LEFT OUTER JOIN <<tenant>>_mdsdb.core_company_final cc ON cc.sys_id = Driver.sys_ID AND cc.sourceinstance = Driver.sourceinstance
	 LEFT OUTER JOIN <<tenant>>_mdsdb.sys_user_final B ON cc.contact = B.sys_id AND cc.sourceinstance = B.sourceinstance
	
	UNION
	
	SELECT 
	CONCAT('DEPARTMENT~',Driver.sys_id) AS ROW_ID,
	Driver.SourceInstance AS SOURCE_ID,

	CONCAT('DEPARTMENT~',cd.parent) AS PARENT_ROW_ID,
	cd.name AS ORGANIZATION_NAME,
	'Y' AS ORGANIZATION_ACTIVE_FLAG,
	NULL AS ORGANIZATION_URL,
	cd.primary_contact AS ORGANIZATION_CONTACT_ID,
	B.Name AS ORGANIZATION_CONTACT_NAME,
	NULL AS ADDRESS,
	NULL AS LEGAL_NAME,
	NULL AS FAX_PHONE_NUMBER,
	NULL AS SUBSIDARY_FISCAL_CALENDAR,
	NULL AS SUBISDARY_CURRENCY_CODE,
	NULL AS CITY_CODE,
	NULL AS STATE_CODE,
	NULL AS POSTAL_CODE,
	NULL AS COUNTRY_CODE,
	NULL AS CONTINENT_CODE,
	'Y' AS DEPARTMENT_FLAG,
	'N' AS LEGAL_ENTITY_FLAG,
	'N' AS INVENTORY_ORG_FLAG,
	'N' AS SUBSIDIARY_FLAG,
	'N' AS CLASSIFICATION_FLAG,
	'N' AS GROUP_FLAG,
	cd.sys_created_by AS CREATED_BY,
	cd.sys_updated_by AS CHANGED_BY,
	cd.sys_created_on AS CREATED_ON,
	cd.sys_updated_on AS CHANGED_ON
	FROM 
	 (SELECT sys_id, sourceinstance
     FROM <<tenant>>_mdsdb.cmn_department_final
	 UNION
	 SELECT A.sys_id, A.sourceinstance
	 FROM <<tenant>>_mdsdb.cmn_department_final A
	 JOIN <<tenant>>_mdsdb.sys_user_final B ON A.primary_contact = B.sys_id AND A.sourceinstance = B.sourceinstance
	 )Driver
	LEFT OUTER JOIN <<tenant>>_mdsdb.cmn_department_final cd ON cd.sys_id = Driver.sys_ID AND cd.sourceinstance = Driver.sourceinstance
	LEFT OUTER JOIN <<tenant>>_mdsdb.sys_user_final B ON cd.primary_contact = B.sys_id AND cd.sourceinstance = B.sourceinstance
	
	UNION
	
	SELECT 
	CONCAT('GROUP~',sug.sys_id) AS ROW_ID,
	sug.SourceInstance AS SOURCE_ID,

	CONCAT('GROUP~',sug.parent) AS PARENT_ROW_ID,
	sug.name AS ORGANIZATION_NAME,
	CASE WHEN sug.active = 1 THEN 'Y' ELSE 'N' END AS ORGANIZATION_ACTIVE_FLAG,
	NULL AS ORGANIZATION_URL,
	NULL AS ORGANIZATION_CONTACT_ID,
	NULL AS ORGANIZATION_CONTACT_NAME,
	NULL AS ADDRESS,
	NULL AS LEGAL_NAME,
	NULL AS FAX_PHONE_NUMBER,
	NULL AS SUBSIDARY_FISCAL_CALENDAR,
	NULL AS SUBISDARY_CURRENCY_CODE,
	NULL AS CITY_CODE,
	NULL AS STATE_CODE,
	NULL AS POSTAL_CODE,
	NULL AS COUNTRY_CODE,
	NULL AS CONTINENT_CODE,
	'N' AS DEPARTMENT_FLAG,
	'N' AS LEGAL_ENTITY_FLAG,
	'N' AS INVENTORY_ORG_FLAG,
	'N' AS SUBSIDIARY_FLAG,
	'N' AS CLASSIFICATION_FLAG,
	'Y' AS GROUP_FLAG,
	sug.sys_created_by AS CREATED_BY,
	sug.sys_updated_by AS CHANGED_BY,
	sug.sys_created_on AS CREATED_ON,
	sug.sys_updated_on AS CHANGED_ON
	FROM <<tenant>>_mdsdb.sys_user_group_final sug;	 

