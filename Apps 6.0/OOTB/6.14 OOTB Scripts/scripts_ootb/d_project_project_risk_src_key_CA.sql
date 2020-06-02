SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_risk_src_key' ELSE 'SUCCESS' END as Message
 FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC1
LEFT JOIN(select CASE WHEN (RCF_FLEXIBILITY+RCF_FUNDING+ RCF_HUMAN_INTERFACE+ RCF_IMPLEMENTATION+ RCF_INTERDEPENDENCY+
 RCF_OBJECTIVES+ RCF_ORG_CULTURE+ RCF_RESOURCE_AVAIL+ RCF_SPONSORSHIP+ RCF_SUPPORTABILITY+ RCF_TECHNICAL)/6
between 0 and 33 then 0
WHEN ( RCF_FLEXIBILITY+ RCF_FUNDING+ RCF_HUMAN_INTERFACE+ RCF_IMPLEMENTATION+ RCF_INTERDEPENDENCY+
 RCF_OBJECTIVES+ RCF_ORG_CULTURE+ RCF_RESOURCE_AVAIL+ RCF_SPONSORSHIP+ RCF_SUPPORTABILITY+ RCF_TECHNICAL)/6 
between 34 and 67 then 50
WHEN
( RCF_FLEXIBILITY+ RCF_FUNDING+ RCF_HUMAN_INTERFACE+ RCF_IMPLEMENTATION+ RCF_INTERDEPENDENCY+
 RCF_OBJECTIVES+ RCF_ORG_CULTURE+ RCF_RESOURCE_AVAIL+ RCF_SPONSORSHIP+ RCF_SUPPORTABILITY+ RCF_TECHNICAL)/6
between 68 and 100 then 100
ELSE NULL END as lkp,PRID from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and cdctype<>'D' )SRC
on SRC1.ID=SRC.PRID
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_project)TRGT   
	ON SRC1.id =TRGT.row_id 
	and SRC1.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON CONCAT('PROJECT~RISK~',SRC.lkp)=LKP.row_id 
WHERE COALESCE(LKP.ROW_KEY,0)<>COALESCE(PROJECT_RISK_SRC_KEY, 0)





