drop table if exists app_test.ds_geography;
create table app_test.ds_geography
	SELECT 
	A.sys_id AS ROW_ID,
	A.SourceInstance AS SOURCE_ID,
	A.parent AS PARENT_ROW_ID,
	NULL AS GEO_ID ,
	NULL AS CITY_CODE,
	NULL AS STATE_CODE,
	A.zip AS POSTAL_CODE,
	A.longitude AS LONGITUDE,
	A.latitude AS LATITUDE,
	NULL AS COUNTRY_CODE,
	NULL AS CONTINENT_CODE,
	A.city AS CITY_NAME,
	A.state AS STATE_NAME,
	A.country AS COUNTRY_NAME,
	NULL AS CONTINENT_NAME,
	A.sys_created_by AS CREATED_BY,
	A.sys_updated_by AS CHANGED_BY,
	A.sys_created_on AS CREATED_ON,
	A.sys_updated_on AS CHANGED_ON
	FROM
	<<tenant>>_mdsdb.cmn_location_final A;
	
