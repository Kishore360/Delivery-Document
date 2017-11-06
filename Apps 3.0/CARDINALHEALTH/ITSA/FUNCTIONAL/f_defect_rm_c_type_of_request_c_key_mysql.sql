 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.rm_defect_final a
JOIN  cardinalhealth_mdwdb.f_defect_rm_c b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join cardinalhealth_mdwdb.d_lov lkp
on COALESCE(CONCAT('TYPE_OF_REQUEST_C~RM_ENHANCEMENT~~~',UPPER(a.u_type_of_request)),'UNSPECIFIED') = lkp.row_id
where coalesce(lkp.row_key,case when a.u_type_of_request is null then 0 else -1 end)<> b.type_of_request_c_key)c

