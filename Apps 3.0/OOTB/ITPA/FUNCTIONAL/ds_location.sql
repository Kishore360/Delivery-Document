drop table if exists app_test.ds_location;
create table app_test.ds_location
	SELECT 
	Driver.sys_id AS ROW_ID,
	Driver.SourceInstance AS SOURCE_ID,
	c.name AS LOCATION_NUMBER,
	'Location' AS LOCATION_TYPE_CODE,
	B.Name AS CONTACT_NAME,
	c.name AS LOCATION_NAME,
	c.contact AS CONTACT_ID,
	c.parent AS PARENT_ROW_ID,
	c.street AS ST_ADDRESS1,
	NULL AS ST_ADDRESS2,
	NULL AS ST_ADDRESS3,
	NULL AS ST_ADDRESS4,
	c.city AS CITY_CODE,
	c.state AS STATE_CODE,
	c.zip AS POSTAL_CODE,
	c.country AS COUNTRY_CODE,
	NULL AS EMAIL_ADDRESS,
	NULL AS MOBILE_NUMBER,
	c.phone AS WORK_PHONE,
	c.time_zone AS TIME_ZONE,
	c.fax_phone AS FAX_PHONE_NUMBER,
    Driver.sys_id as geo_id,
	c.sys_created_by AS CREATED_BY,
	c.sys_updated_by AS CHANGED_BY,
	c.sys_created_on AS CREATED_ON,
	c.sys_updated_on AS CHANGED_ON
	FROM 
	(SELECT sys_id,sourceinstance
	 FROM <<tenant>>_mdsdb.cmn_location_final
	 UNION
	 SELECT A.sys_id, A.sourceinstance
	 FROM <<tenant>>_mdsdb.cmn_location_final A
	 JOIN <<tenant>>_mdsdb.sys_user_final B ON A.contact = B.sys_id AND A.sourceinstance = B.sourceinstance
	)Driver
	LEFT OUTER JOIN <<tenant>>_mdsdb.cmn_location_final c ON c.sys_id = Driver.sys_ID AND c.sourceinstance = Driver.sourceinstance
	LEFT OUTER JOIN <<tenant>>_mdsdb.sys_user_final B ON c.contact = B.sys_id AND c.sourceinstance = B.sourceinstance;	
