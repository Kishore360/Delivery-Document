SELECT CASE WHEN sum(cnt) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN sum(cnt) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.value' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as cnt from 
(
select trgt.value,trgt.row_id,trgt.source_id from nypres_mdwdb.f_request_item_variable_c trgt
join
(
SELECT 
COALESCE(LEFT(a.value,4000), 'UNSPECIFIED') as name ,CONCAT(a.sys_id,'~',c.request_item) as row_id,a.sourceinstance AS SOURCE_ID
FROM nypres_mdsdb.sc_item_option_final a 
	INNER JOIN nypres_mdsdb.item_option_new_final b ON b.sys_id = a.item_option_new 
	INNER JOIN nypres_mdsdb.sc_item_option_mtom_final c ON c.sc_item_option = a.sys_id 
	INNER JOIN nypres_mdsdb.sc_req_item_final d ON c.request_item = d.sys_id
WHERE b.type not in (11,12,14,15,17,19,20,21,23) 	) T	
on  trgt.row_id=T.row_id and trgt.source_id=T.source_id
JOIN
(SELECT A.name AS name,A.sys_id AS sys_id,A.sourceinstance AS sourceinstance FROM nypres_mdsdb.sys_user_final A
UNION ALL
SELECT REPLACE(CONVERT(B.name USING latin1),'?',' ') AS name,B.sys_id AS sys_id,B.sourceinstance AS sourceinstance FROM nypres_mdsdb.cmdb_ci_final B
UNION ALL
SELECT C.name AS name,C.sys_id AS sys_id,C.sourceinstance AS sourceinstance FROM nypres_mdsdb.cmn_department_final C
UNION ALL
SELECT D.name AS name,D.sys_id AS sys_id,D.sourceinstance AS sourceinstance FROM nypres_mdsdb.cmn_location_final D
UNION ALL
SELECT E.u_department AS name,E.sys_id AS sys_id,E.sourceinstance AS sourceinstance  FROM nypres_mdsdb.u_esaf_departments_final E
UNION ALL
SELECT F.u_division AS name,F.sys_id AS sys_id,F.sourceinstance AS sourceinstance  FROM nypres_mdsdb.u_esaf_divisions_final F
UNION ALL
SELECT G.u_security_clASs AS name,G.sys_id AS sys_id,G.sourceinstance AS sourceinstance FROM nypres_mdsdb.u_lawson_security_class_final G
UNION ALL
SELECT H.u_description AS name,H.sys_id AS sys_id,H.sourceinstance AS sourceinstance FROM nypres_mdsdb.u_nyp_cost_center_final H
)SRC
ON T.name = SRC.sys_id and T.SOURCE_ID = SRC.sourceinstance

where trgt.value <>SRC.name)a) temp