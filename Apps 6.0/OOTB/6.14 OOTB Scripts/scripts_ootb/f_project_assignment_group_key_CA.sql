SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.ASSIGNMENT_GROUP_KEY' ELSE 'SUCCESS' END as Message
FROM (select * from   itpa_l_dev_mdsdb.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from  itpa_l_dev_mdsdb.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from   itpa_l_dev_mdwdb.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
where COALESCE(TRGT.ASSIGNMENT_GROUP_KEY,'0') <> 0