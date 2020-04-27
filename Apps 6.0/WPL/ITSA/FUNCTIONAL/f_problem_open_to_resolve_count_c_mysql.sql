SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_problem.open_to_resolve_count_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as CNT from wpl_mdwdb.f_problem tgt
join wpl_mdwdb.d_problem dim
on tgt.problem_key=dim.row_key
join wpl_mdsdb.problem_final der
 on  tgt.row_id=der.sys_id and tgt.source_id=der.sourceinstance
 where  (tgt.open_to_resolve_count_c<>CASE WHEN Date_Format(tgt.opened_on_key,'%Y%m')=
Date_Format((Date_Format(dim.resloved_date_c,'%Y%m%d')),'%Y%m') THEN 1 else 0 END
and der.cdctype<>'D'))der;