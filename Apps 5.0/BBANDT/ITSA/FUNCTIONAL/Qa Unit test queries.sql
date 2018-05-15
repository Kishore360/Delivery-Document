
SELECT
CONCAT('d_clarity_project_c_',column_name,'_c_mysql.sql'),
CONCAT('SELECT CASE WHEN count(1)  THEN \'FAILURE\' ELSE \'SUCCESS\' END as Result, 
CASE WHEN count(1)  THEN \'MDS to DWH data validation failed for d_clarity_project_c.',column_name,'_c\' ELSE \'SUCCESS\' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.',table_name,' src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.',column_name,'_c <>src.',column_name,';'
)
FROM information_schema.columns where table_schema='bbandt_mdsdb' and table_name ='bbt_prj_data_qlkview_final'
and column_name not in('cdchash','cdchash_sequence','sourceinstance','cdctime');

=================================================
d_clarity_portfolio_c_portfoliomanagers_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_portfolio_c.portfoliomanagers_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_portfolio_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_portf_prj_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.portfoliomanagers_c <>src.`portfoliomanagers-1759928439`;

d_clarity_portfolio_c_investment_code_c_mysql.sql
	SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_portfolio_c.investment_code_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_portfolio_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_portf_prj_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.investment_code_c <>src.investment_code;

d_clarity_portfolio_c_investment_id_c_mysql.sql
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_portfolio_c.investment_id_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_portfolio_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_portf_prj_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.investment_id_c <>src.investment_id;

d_clarity_portfolio_c_investment_name_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_portfolio_c.investment_name_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_portfolio_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_portf_prj_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.investment_name_c <>src.investment_name;

d_clarity_portfolio_c_portfolio_id_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_portfolio_c.portfolio_id_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_portfolio_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_portf_prj_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.portfolio_id_c <>src.portfolio_id;

d_clarity_portfolio_c_portfolio_name_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_portfolio_c.portfolio_name_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_portfolio_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_portf_prj_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.portfolio_name_c <>src.portfolio_name;

=============================================================

d_clarity_project_c_bbtrelationshipmanager_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.bbtrelationshipmanager_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.bbtrelationshipmanager_c <>src.`bbtrelationshipmanager-1281131951`;

d_clarity_project_c_lob_3_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.lob_3_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.lob_3_c <>src.`lob-3`;

d_clarity_project_c_lob_2_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.lob_2_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.lob_2_c <>src.`lob-2`;


d_clarity_project_c_lineofbusiness469297661_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.lineofbusiness469297661_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.lineofbusiness469297661_c <>src.lineofbusiness469297661;


d_clarity_project_c_lob_1_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.lob_1_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.lob_1_c <>src.`lob-1`;

d_clarity_project_c_lob_0_c_mysql.sql	SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.lob_0_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.lob_0_c <>src.`lob-0`;


d_clarity_project_c_executivesponsor_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.executivesponsor_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.executivesponsor_c <>src.`executivesponsor-675255646`;


d_clarity_project_c_projectopenfortimeentry_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.projectopenfortimeentry_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.projectopenfortimeentry_c <>src.`projectopenfortimeentry-1939393051`;


d_clarity_project_c_worktype_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.worktype_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.worktype_c <>src.`worktype-1259598103`;


d_clarity_project_c_projectmanager981343590_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.projectmanager981343590_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.projectmanager981343590_c <>src.projectmanager981343590;


d_clarity_project_c_objective_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.objective_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.objective_c <>src.objective;

d_clarity_project_c_executionprocess_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.executionprocess_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.executionprocess_c <>src.`executionprocess-992475865`;


d_clarity_project_c_finish_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.finish_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.finish_c <>src.finish;


d_clarity_project_c_statusindicator_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.statusindicator_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.statusindicator_c <>src.`statusindicator-1086566559`;


d_clarity_project_c_financialstatus1017122729_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.financialstatus1017122729_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.financialstatus1017122729_c <>src.financialstatus1017122729;


d_clarity_project_c_businessunitid903250135_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.businessunitid903250135_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.businessunitid903250135_c <>src.businessunitid903250135;


d_clarity_project_c_projecttype1044775969_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.projecttype1044775969_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.projecttype1044775969_c <>src.projecttype1044775969;


d_clarity_project_c_investment_id_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.investment_id_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.investment_id_c <>src.investment_id;


d_clarity_project_c_projectfundingalignment656919257_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.projectfundingalignment656919257_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.projectfundingalignment656919257_c <>src.projectfundingalignment656919257;

d_clarity_project_c_start_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.start_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.start_c <>src.start;


d_clarity_project_c_projectcostcenter_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.projectcostcenter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.projectcostcenter_c <>src.`projectcostcenter-1450964639`;


d_clarity_project_c_projectactive_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.projectactive_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.projectactive_c <>src.`projectactive-1556785619`;


d_clarity_project_c_master_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.master_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.master_c <>src.master;


d_clarity_project_c_stage_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.stage_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.stage_c <>src.stage;


d_clarity_project_c_domain_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.domain_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.domain <>src.domain;


d_clarity_project_c_managinggroup1209149889_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.managinggroup1209149889_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.managinggroup1209149889_c <>src.managinggroup1209149889;


d_clarity_project_c_investmentname_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.investmentname_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.investmentname_c <>src.`investmentname-635555912`;


d_clarity_project_c_workstatus673325025_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.workstatus673325025_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.workstatus673325025_c <>src.workstatus673325025;


d_clarity_project_c_workcategory1552076077_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.workcategory1552076077_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.workcategory1552076077_c <>src.workcategory1552076077;

==================================================================

d_clarity_resource_c_resourcerole1719380296_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.resourcerole1719380296_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resourcerole1719380296_c <>src.resourcerole1719380296;


d_clarity_resource_c_managername1332864862_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.managername1332864862_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.managername1332864862_c <>src.managername1332864862;


d_clarity_resource_c_createddate2107849254_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.createddate2107849254_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.createddate2107849254_c <>src.createddate2107849254;


d_clarity_resource_c_slt1_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.slt1_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.slt1_c <>src.`slt1-1392216967`;


d_clarity_resource_c_slt3_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.slt3_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.slt3_c <>src.`slt3-1392216965`;


d_clarity_resource_c_sltexec964227945_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.sltexec964227945_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.sltexec964227945_c <>src.sltexec964227945;


d_clarity_resource_c_vendor_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.vendor_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.vendor_c <>src.vendor;


d_clarity_resource_c_primaryareaoffocus111279492_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.primaryareaoffocus111279492_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.primaryareaoffocus111279492_c <>src.primaryareaoffocus111279492;


d_clarity_resource_c_slt0_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.slt0_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.slt0_c <>src.`slt0-1392216968`;


d_clarity_resource_c_slt4_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.slt4_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.slt4_c <>src.`slt4-1392216964`;


d_clarity_resource_c_dateofhire1108055403_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.dateofhire1108055403_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.dateofhire1108055403_c <>src.dateofhire1108055403;



d_clarity_resource_c_slt2_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.slt2_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.slt2_c <> src.`slt2-1392216966`;


d_clarity_resource_c_isrole_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.isrole_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.isrole_c <>src.`isrole-607250004`;


d_clarity_resource_c_slt5_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.slt5_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.slt5_c <>src.`slt5-1392216963`;


d_clarity_resource_c_primaryrole_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.primaryrole_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.primaryrole_c <>src.`primaryrole-1009083372`;


d_clarity_resource_c_resourceid_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.resourceid-1392623027_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resourceid_c <>src.`resourceid-1392623027`;


d_clarity_resource_c_departmentobs_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.departmentobs_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.departmentobs_c <>src.`departmentobs-1265708238`;


d_clarity_resource_c_trackmode_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.trackmode_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.trackmode_c <>src.`trackmode-1200906344`;


d_clarity_resource_c_dateoftermination_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.dateoftermination_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.dateoftermination_c <>src.`dateoftermination-1038275411`;

d_clarity_resource_c_resourceactive_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.resourceactive_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resourceactive_c <>src.`resourceactive-1735476392`;


d_clarity_resource_c_employmenttype_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.employmenttype_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.employmenttype_c <>src.`employmenttype-1585734930`;


d_clarity_resource_c_resourceopenfortimeentry1081790106_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_resource_c.resourceopenfortimeentry1081790106_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_resource_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_rsrc_data_qlkview_final src
on src.`resourceid-1392623027` = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resourceopenfortimeentry1081790106_c <>src.resourceopenfortimeentry1081790106;

=============================================================================


==========================================================================
d_clarity_time_data_c_employee_type_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.employee_type_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.employee_type_filter_c <>src.employee_type_filter;



d_clarity_time_data_c_project_cost_center_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_cost_center_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_cost_center_c <>src.project_cost_center;



d_clarity_time_data_c_lob_priority_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.lob_priority_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.lob_priority_c <>src.lob_priority;


d_clarity_time_data_c_project_status_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_status_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_status_c <>src.project_status;


d_clarity_time_data_c_resource_cost_center_num_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.resource_cost_center_num_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resource_cost_center_num_c <>src.resource_cost_center_num;


d_clarity_time_data_c_row_num_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.row_num_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.row_num_c <>src.row_num;


d_clarity_time_data_c_project_name_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_name' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_name <>src.project_name;


d_clarity_time_data_c_mon_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.mon_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.mon_c <>src.mon;

d_clarity_time_data_c_resource_manager_filter_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.resource_manager_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resource_manager_filter_c <>src.resource_manager_filter;

d_clarity_time_data_c_app_grouping_filter_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.app_grouping_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.app_grouping_filter_c <>src.app_grouping_filter;


d_clarity_time_data_c_trans_class_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.trans_class_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.trans_class_c <>src.trans_class;


d_clarity_time_data_c_funding_cat_filter_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.funding_cat_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.funding_cat_filter_c <>src.funding_cat_filter;

d_clarity_time_data_c_yr_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.yr_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.yr_c <>src.yr;


d_clarity_time_data_c_project_manager_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_manager_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_manager_c <>src.project_manager;

d_clarity_time_data_c_work_status_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.work_status_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.work_status_c <>src.work_status;

d_clarity_time_data_c_project_num_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_num_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_num_c <>src.project_num;

d_clarity_time_data_c_slt_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.slt_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.slt_filter_c <>src.slt_filter;


d_clarity_time_data_c_resource_id_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.resource_id_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resource_id_filter_c <>src.resource_id_filter;


d_clarity_time_data_c_fund_align_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.fund_align_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.fund_align_filter_c <>src.fund_align_filter;

d_clarity_time_data_c_project_status_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_status_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_status_filter_c <>src.project_status_filter;


d_clarity_time_data_c_task_work_type_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.task_work_type_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.task_work_type_c <>src.task_work_type;

d_clarity_time_data_c_corp_obj_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.corp_obj_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.corp_obj_c <>src.corp_obj;

d_clarity_time_data_c_project_cost_type_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_cost_type_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_cost_type_c <>src.project_cost_type;


d_clarity_time_data_c_work_status_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.work_status_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.work_status_filter_c <>src.work_status_filter;

d_clarity_time_data_c_qtr_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.qtr_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.qtr_c <>src.qtr;

d_clarity_time_data_c_project_start_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_start_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_start_c <>src.project_start;

d_clarity_time_data_c_exec_sponsor_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.exec_sponsor_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.exec_sponsor_filter_c <>src.exec_sponsor_filter;

d_clarity_time_data_c_domain_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.domain_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.domain_c <>src.domain;


d_clarity_time_data_c_funding_align_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.funding_align_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.funding_align_c <>src.funding_align;

d_clarity_time_data_c_resource_cost_center_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.resource_cost_center_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resource_cost_center_c <>src.resource_cost_center;

d_clarity_time_data_c_slt_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.slt_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.slt_c <>src.slt;

d_clarity_time_data_c_phase_name_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.phase_name_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.phase_name_c <>src.phase_name;

d_clarity_time_data_c_trans_class_filter_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.trans_class_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.trans_class_filter_c <>src.trans_class_filter;

d_clarity_time_data_c_lob_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.lob_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.lob_c <>src.lob;

d_clarity_time_data_c_posted_hours_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.posted_hours_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.posted_hours_c <>src.posted_hours;

d_clarity_time_data_c_resource_project_role_c_mysql.sql	
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.resource_project_role_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resource_project_role_c <>src.resource_project_role;

d_clarity_time_data_c_task_name_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.task_name_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.task_name_c <>src.task_name;

d_clarity_time_data_c_lob_priority_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.lob_priority_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.lob_priority_filter_c <>src.lob_priority_filter;

d_clarity_time_data_c_resource_manager_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.resource_manager_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resource_manager_c <>src.resource_manager;

d_clarity_time_data_c_time_type_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.time_type_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.time_type_c <>src.time_type;

d_clarity_time_data_c_exec_sponsor_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.exec_sponsor_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.exec_sponsor_c <>src.exec_sponsor;

d_clarity_time_data_c_rel_man_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.rel_man_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.rel_man_c <>src.rel_man;

d_clarity_time_data_c_task_id_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.task_id_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.task_id_c <>src.task_id;

d_clarity_time_data_c_project_category_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_category_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_category_c <>src.project_category;

d_clarity_time_data_c_resource_primary_role_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.resource_primary_role_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resource_primary_role_c <>src.resource_primary_role;

d_clarity_time_data_c_phase_indicator_id_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.phase_indicator_id_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.phase_indicator_id_c <>src.phase_indicator_id;

d_clarity_time_data_c_rel_man_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.rel_man_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.rel_man_filter_c <>src.rel_man_filter;

d_clarity_time_data_c_wk_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.wk_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.wk_c <>src.wk;

d_clarity_time_data_c_phase_indicator_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.phase_indicator_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.phase_indicator_c <>src.phase_indicator;

d_clarity_time_data_c_task_applications_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.task_applications_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.task_applications_c <>src.task_applications;

d_clarity_time_data_c_cost_center_mgr_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.cost_center_mgr_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.cost_center_mgr_c <>src.cost_center_mgr;


d_clarity_time_data_c_domain_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.domain_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.domain_filter_c <>src.domain_filter;

d_clarity_time_data_c_term_date_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.term_date_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.term_date_c <>src.term_date;

d_clarity_time_data_c_managing_group_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.managing_group_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.managing_group_c <>src.managing_group;

d_clarity_time_data_c_task_work_type_id_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.task_work_type_id_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.task_work_type_id_c <>src.task_work_type_id;

d_clarity_time_data_c_app_grouping_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.app_grouping_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.app_grouping_c <>src.app_grouping;

d_clarity_time_data_c_project_id_filter_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_id_filter_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_id_filter_c <>src.project_id_filter;

d_clarity_time_data_c_project_finish_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_finish_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_finish_c <>src.project_finish;


d_clarity_time_data_c_funding_category_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.funding_category_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.funding_category_c <>src.funding_category;


d_clarity_time_data_c_resource_id_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.resource_id_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resource_id_c <>src.resource_id;

d_clarity_time_data_c_task_customer_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.task_customer_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.task_customer_c <>src.task_customer;

d_clarity_time_data_c_time_entry_date_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.time_entry_date_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.time_entry_date_c <>src.time_entry_date;

d_clarity_time_data_c_resource_name_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.resource_name_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.resource_name_c <>src.resource_name;

d_clarity_time_data_c_applications_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.applications_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.applications_c <>src.applications;

d_clarity_time_data_c_customer_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.customer_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.customer_c <>src.customer;


d_clarity_time_data_c_project_cost_center_num_c_mysql.sql	

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.project_cost_center_num_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.project_cost_center_num_c <>src.project_cost_center_num;