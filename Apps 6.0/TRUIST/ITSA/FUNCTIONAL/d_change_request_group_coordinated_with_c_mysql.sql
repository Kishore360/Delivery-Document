SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.group_coordinated_with_c' ELSE 'SUCCESS' END as Message 
 from truist_mdwdb.d_change_request trgt 
left join (select grpcord.change_request_key, group_concat(distinct grp.organization_name) as res
from truist_mdwdb.f_group_coordinated_with_c grpcord
join truist_mdwdb.d_internal_organization grp 
on grpcord.group_coordinated_with_c_key = grp.row_key 
and grpcord.etl_run_number = 0 
and grpcord.pivot_date between grp.effective_from and grp.effective_to group by change_request_key) src 
on trgt.row_key = src.change_request_key
where trgt.group_coordinated_with_c <> LEFT(COALESCE(src.res,'UNSPECIFIED'),4000);