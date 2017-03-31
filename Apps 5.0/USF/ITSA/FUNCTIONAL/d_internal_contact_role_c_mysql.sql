SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM usf_mdsdb.sys_user_final SRC 
LEFT JOIN 
(SELECT BB.sys_id,BB.sourceinstance AS source_id,
CASE 
WHEN lower(BB.Strng) LIKE '%faculty%' THEN 'Faculty'
WHEN lower(BB.Strng) LIKE '%employee%' THEN 'Employee'
WHEN lower(BB.Strng) LIKE '%student%' THEN 'Student'
ELSE BB.Strng END AS role_c
FROM
(SELECT AA.sys_id,AA.sourceinstance,GROUP_CONCAT(AA.namess SEPARATOR ',') as Strng FROM (
SELECT a.sys_id,a.sourceinstance,b.sys_id AS role_sys_id,a.u_usf_roles,COALESCE(b.u_name,'') AS namess 
 FROM usf_mdsdb.sys_user_final a 
 LEFT JOIN usf_mdsdb.u_usf_roles_final b ON SUBSTRING(a.u_usf_roles,1+((CAST((FIND_IN_SET(b.sys_id,a.u_usf_roles) ) AS SIGNED)-1)*33),32) = b.sys_id 
) AA GROUP BY AA.sys_id,AA.sourceinstance
) BB) SRC1
ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.source_id
LEFT JOIN usf_mdwdb.d_internal_contact TRGT 
ON TRGT.row_id = CONCAT('INTERNAL_CONTACT~',SRC1.sys_id) AND TRGT.source_id=SRC.sourceinstance
WHERE CASE WHEN SRC.u_usf_roles IS NULL THEN 'UNSPECIFIED' ELSE COALESCE(SRC1.role_c,'UNKNOWN') END<> TRGT.role_c)t;
