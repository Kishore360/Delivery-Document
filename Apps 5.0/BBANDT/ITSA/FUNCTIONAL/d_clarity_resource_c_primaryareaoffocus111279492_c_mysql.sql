SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.primaryareaoffocus111279492_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.primaryareaoffocus111279492_c <>src.primaryareaoffocus111279492;