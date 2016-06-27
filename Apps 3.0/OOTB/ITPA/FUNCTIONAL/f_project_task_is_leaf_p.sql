 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.is_leaf' ELSE 'SUCCESS' END as Message
 FROM
( SELECT COUNT(SRC.Children) Cnt,SRC.Parent as row_id,SRC.source_id
 FROM 
 (SELECT  C.sys_id AS Children,P.sys_id AS Parent,P.sourceinstance AS source_id 
 FROM <<tenant>>_mdsdb.pm_project_task_final P 
 LEFT JOIN <<tenant>>_mdsdb.pm_project_task_final C
 ON(C.parent=P.sys_id and C.parent is not null)
 UNION
 SELECT  C.sys_id AS Children,P.sys_id AS Parent,P.sourceinstance AS source_id 
 FROM <<tenant>>_mdsdb.pm_project_final P 
 LEFT JOIN <<tenant>>_mdsdb.pm_project_task_final C
  ON(C.parent=P.sys_id and C.parent is not null)
 UNION
 SELECT  C.sys_id AS Children,P.sys_id AS Parent,P.sourceinstance AS source_id 
 FROM <<tenant>>_mdsdb.pm_project_final P 
 LEFT JOIN <<tenant>>_mdsdb.pm_project_final C
  ON(C.parent=P.sys_id and C.parent is not null)
UNION
 SELECT  C.sys_id AS Children,P.sys_id AS Parent,P.sourceinstance AS source_id 
 FROM <<tenant>>_mdsdb.pm_project_task_final P 
 LEFT JOIN <<tenant>>_mdsdb.pm_project_final C
  ON(C.parent=P.sys_id and C.parent is not null)
 ) SRC
GROUP BY SRC.Parent,SRC.source_id
) SRC_F
JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC_F.row_id =TRGT.row_id 
 AND SRC_F.source_id =TRGT.source_id )
WHERE COALESCE(CASE WHEN SRC_F.Cnt = 0 THEN 'Y' ELSE 'N' END , '')<> COALESCE(TRGT.is_leaf, '')
  
