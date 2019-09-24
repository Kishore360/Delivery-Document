SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.completed_changes_c' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdwdb.d_change_request a 
join rogers6_mdwdb.f_change_request f 
on a.row_key=f.change_request_key AND a.source_id=f.source_id
where CASE WHEN complete_date_c is NOT NULL THEN 1 ELSE 0 END <>f.completed_changes_c
 and a.soft_deleted_flag='N' and f.soft_deleted_flag='N';