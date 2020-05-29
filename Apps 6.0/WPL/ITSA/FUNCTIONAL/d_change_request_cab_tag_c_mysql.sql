SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT >0 THEN 'MDS to DWH data Validation failed for d_change_request.cab_tag_c' ELSE 'SUCCESS' END AS MESSAGE
FROM ( select count(1) cnt from  wpl_mdsdb.change_request_final a
left join wpl_mdwdb.d_change_request b on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where coalesce(a.u_cab_tag,'UNSPECIFIED')<>b.cab_tag_c
and a.cdctype='X')a;


