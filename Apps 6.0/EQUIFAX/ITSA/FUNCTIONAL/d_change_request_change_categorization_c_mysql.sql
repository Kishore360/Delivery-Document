SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_change_request.change_categorization_c' ELSE 'SUCCESS' END as Message 
FROM
(
select count(1) as CNT from equifax_mdwdb.d_change_request dim
join equifax_mdsdb.change_request_final src 
on dim.row_id=src.sys_id and dim.source_id=src.sourceinstance
where dim.change_categorization_c<>coalesce(u_change_categorization,'UNSPECIFIED'))der;