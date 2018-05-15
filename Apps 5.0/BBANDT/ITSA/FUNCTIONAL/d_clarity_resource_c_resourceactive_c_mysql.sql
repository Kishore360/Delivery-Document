SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.resourceactive_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resourceactive_c <>src.`resourceactive-1735476392`