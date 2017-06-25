SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM nypres_mdwdb.d_task TRGT
JOIN (SELECT CASE WHEN locate('Y',B.res)>0 then 'Y' else 'N' END as src_result,B.sys_id FROM
(SELECT A.documentkey as sys_id,group_concat(A.flag) as res FROM
(SELECT CASE WHEN newvalue<oldvalue then 'Y' else 'N' end as flag,documentkey FROM nypres_mdsdb.sys_audit_final
WHERE fieldname='priority' and oldvalue is not null and newvalue is not null) as A
GROUP BY A.documentkey)as B) as C
ON  TRGT.row_id= C.sys_id
WHERE C.src_result<>TRGT.priority_escalated_c_flag 