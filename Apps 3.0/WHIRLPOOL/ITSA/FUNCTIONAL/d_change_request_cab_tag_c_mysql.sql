SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT >0 THEN 'MDS to DWH data Validation failed for d_change_request.cab_tag_c' ELSE 'SUCCESS' END AS MESSAGE
FROM ( select count(1) cnt from  whirlpool_mdsdb.change_request_final
left join whirlpool_mdwdb.d_change_request on sys_id=row_id and sourceinstance=source_id
where coalesce(u_cab_tag,'-99')<>coalesce(cab_tag_c,'-99') )a;


