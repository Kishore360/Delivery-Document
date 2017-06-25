SELECT CASE WHEN SUM(RES.a) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN SUM(RES.a) >0 THEN 'MDS to DWH data validation failed for d_task.major_c_flag' ELSE 'SUCCESS' END as Message  
FROM
(
select count(1) as a
FROM   nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC 
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  AND TRGT.task_type NOT LIKE'incident'
WHERE (CASE WHEN SRC.priority=1 THEN 'Y' ELSE 'N' END)<>TRGT.major_c_flag
UNION
SELECT count(1) as a
FROM  nypres_mdwdb.d_task TRGT
join nypres_mdsdb.task_final SRC
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  AND TRGT.task_type LIKE'incident'
join nypres_mdsdb.incident_final SRC_INC
ON TRGT.row_id = SRC_INC.sys_id and TRGT.source_id=SRC_INC.sourceinstance
WHERE (CASE WHEN SRC_INC.impact in (1,2,3) and SRC_INC.urgency in (1,2) THEN 'Y' ELSE 'N' END)<>TRGT.major_c_flag) RES