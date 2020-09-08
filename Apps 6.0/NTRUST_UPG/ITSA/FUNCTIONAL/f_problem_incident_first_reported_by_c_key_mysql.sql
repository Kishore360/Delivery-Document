


				SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END
as Message from(
select count(1) as cnt from
	ntrust_mdsdb.problem_final SRC
JOIN ntrust_mdwdb.f_problem TRGT
ON   	SRC.sys_id				=		TRGT.row_id and TRGT.source_id 		= SRC.sourceinstance
JOIN 	ntrust_mdwdb.d_internal_contact  TRGT2 ON
  on  coalesce(SRC.first_reported_by_task,'UNSPECIFIED')=TRGT2.row_id
  AND SRC.sourceinstance=TRGT2.source_id
where (TRGT2.row_key)
where coalesce(TRGT2.row_key,case when SRC.first_reported_by_task is null then 0 else -1 end)
         <> TRGT.first_reported_by_c_key and SRC.cdctype='X' )temp;

		