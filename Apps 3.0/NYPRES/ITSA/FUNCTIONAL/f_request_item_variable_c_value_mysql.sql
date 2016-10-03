SELECT CASE WHEN sum(cnt) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN sum(cnt) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.value' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as cnt from 
(SELECT (LEFT(TRGT.row_id,locate('~',TRGT.row_id)-1)) AS row_id,source_id,LEFT(VALUE,4000) AS VALUE
FROM nypres_mdwdb.f_request_item_variable_c TRGT) T
JOIN nypres_mdsdb.sc_item_option_final FIN on T.row_id = FIN.sys_id and T.source_id = FIN.sourceinstance
JOIN
(SELECT LEFT(A.name,4000) AS name,A.sys_id AS sys_id,A.sourceinstance AS sourceinstance FROM nypres_mdsdb.sys_user_final A
UNION ALL
SELECT REPLACE(CONVERT(B.name USING latin1),'?',' ') AS name,B.sys_id AS sys_id,B.sourceinstance AS sourceinstance FROM nypres_mdsdb.cmdb_ci_final B
UNION ALL
SELECT LEFT(C.name,4000) AS name,C.sys_id AS sys_id,C.sourceinstance AS sourceinstance FROM nypres_mdsdb.cmn_department_final C
UNION ALL
SELECT LEFT(D.name,4000) AS name,D.sys_id AS sys_id,D.sourceinstance AS sourceinstance FROM nypres_mdsdb.cmn_location_final D
UNION ALL
SELECT LEFT(E.u_department,4000) AS name,E.sys_id AS sys_id,E.sourceinstance AS sourceinstance  FROM nypres_mdsdb.u_esaf_departments_final E
UNION ALL
SELECT LEFT(F.u_division,4000) AS name,F.sys_id AS sys_id,F.sourceinstance AS sourceinstance  FROM nypres_mdsdb.u_esaf_divisions_final F
UNION ALL
SELECT LEFT(G.u_security_clASs,4000) AS name,G.sys_id AS sys_id,G.sourceinstance AS sourceinstance FROM nypres_mdsdb.u_lawson_security_class_final G
UNION ALL
SELECT LEFT(H.u_description,4000) AS name,H.sys_id AS sys_id,H.sourceinstance AS sourceinstance FROM nypres_mdsdb.u_nyp_cost_center_final H
)SRC
ON FIN.value = SRC.sys_id and FIN.sourceinstance = SRC.sourceinstance
where T.value <> SRC.name
UNION
select count(1) as cnt from (
(SELECT (LEFT(TRGT.row_id,locate('~',TRGT.row_id)-1)) AS row_id,source_id,LEFT(VALUE,4000) AS VALUE 
FROM nypres_mdwdb.f_request_item_variable_c TRGT) T
JOIN nypres_mdsdb.sc_item_option_final FIN on T.row_id = FIN.sys_id and T.source_id = FIN.sourceinstance
LEFT JOIN
(SELECT LEFT(A.name,4000) AS name,A.sys_id AS sys_id,A.sourceinstance AS sourceinstance FROM nypres_mdsdb.sys_user_final A
UNION ALL
SELECT REPLACE(CONVERT(B.name USING latin1),'?',' ') AS name,B.sys_id AS sys_id,B.sourceinstance AS sourceinstance FROM nypres_mdsdb.cmdb_ci_final B
UNION ALL
SELECT LEFT(C.name,4000) AS name,C.sys_id AS sys_id,C.sourceinstance AS sourceinstance FROM nypres_mdsdb.cmn_department_final C
UNION ALL
SELECT LEFT(D.name,4000) AS name,D.sys_id AS sys_id,D.sourceinstance AS sourceinstance FROM nypres_mdsdb.cmn_location_final D
UNION ALL
SELECT LEFT(E.u_department,4000) AS name,E.sys_id AS sys_id,E.sourceinstance AS sourceinstance  FROM nypres_mdsdb.u_esaf_departments_final E
UNION ALL
SELECT LEFT(F.u_division,4000) AS name,F.sys_id AS sys_id,F.sourceinstance AS sourceinstance  FROM nypres_mdsdb.u_esaf_divisions_final F
UNION ALL
SELECT LEFT(G.u_security_clASs,4000) AS name,G.sys_id AS sys_id,G.sourceinstance AS sourceinstance FROM nypres_mdsdb.u_lawson_security_class_final G
UNION ALL
SELECT LEFT(H.u_description,4000) AS name,H.sys_id AS sys_id,H.sourceinstance AS sourceinstance FROM nypres_mdsdb.u_nyp_cost_center_final H
)SRC
ON FIN.value = SRC.sys_id  and FIN.sourceinstance = SRC.sourceinstance)
where T.value <> LEFT(FIN.value,4000) and SRC.name is NULL
) X
-- 47 seconds to execute