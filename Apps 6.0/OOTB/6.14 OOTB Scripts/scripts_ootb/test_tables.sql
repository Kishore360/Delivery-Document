CREATE TABLE `test_results` (
  `TEST_RUN_ID` varchar(100) DEFAULT NULL,
  `TEST_SUITE_NAME` varchar(100) DEFAULT NULL,
  `TEST_CASE_ID` varchar(100) DEFAULT NULL,
  `INSTANCE_ID` varchar(20) DEFAULT NULL,
  `TEST_GROUP_ID` varchar(100) DEFAULT NULL,
  `APP_MODULE_ID` varchar(100) DEFAULT NULL,
  `TEST_CATEGORY` varchar(100) DEFAULT NULL,
  `TEST_SUB_CATEGORY` varchar(100) DEFAULT NULL,
  `PARALLEL_GROUP_ID` varchar(100) DEFAULT NULL,
  `TEST_OBJECT` varchar(1000) DEFAULT NULL,
  `TEST_PARAMETER` varchar(2000) DEFAULT NULL,
  `TEST_CASE_DESC` varchar(1000) DEFAULT NULL,
  `CRITICAL` bit(1) DEFAULT NULL,
  `TEST_ATTRIBUTE` varchar(500) DEFAULT NULL,
  `PRE_TEST_SCRIPTS` varchar(100) DEFAULT NULL,
  `TEST_SCRIPTS` varchar(100) DEFAULT NULL,
  `POST_TEST_SCRIPTS` varchar(100) DEFAULT NULL,
  `GOLDEN_FILES` varchar(100) DEFAULT NULL,
  `TEST_TEMPLATE` varchar(100) DEFAULT NULL,
  `RECORD_COUNT` int(10) DEFAULT '0',
  `COLUMN_COVERAGE` double(10,2) DEFAULT NULL,
  `EXECUTION_STATUS` varchar(20) DEFAULT NULL,
  `EXECUTION_TIME` int(10) DEFAULT '0',
  `START_TIME` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `END_TIME` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `RESULT` varchar(100) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(500) DEFAULT NULL,
  KEY `TEST_RUN_ID_INDEX` (`TEST_RUN_ID`),
  KEY `TEST_SUITE_NAME_INDEX` (`TEST_SUITE_NAME`),
  KEY `TEST_CASE_ID_INDEX` (`TEST_CASE_ID`),
  KEY `TEST_GROUP_ID_INDEX` (`TEST_GROUP_ID`),
  KEY `APP_MODULE_ID_INDEX` (`APP_MODULE_ID`),
  KEY `TEST_CATEGORY_INDEX` (`TEST_CATEGORY`),
  KEY `TEST_SUB_CATEGORY_INDEX` (`TEST_SUB_CATEGORY`),
  KEY `RESULT_INDEX` (`RESULT`),
  KEY `TEST_OBJECT_INDEX` (`TEST_OBJECT`(767))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `test_summary` (
  `TEST_RUN_ID` varchar(100) DEFAULT NULL,
  `TEST_SUITE_NAME` varchar(100) DEFAULT NULL,
  `EXECUTED_BY` varchar(50) DEFAULT NULL,
  `TEST_PLAN_PARAM` varchar(50) DEFAULT NULL,
  `TEST_GROUP_PARAM` varchar(50) DEFAULT NULL,
  `TEST_APP_MODULE_PARAM` varchar(50) DEFAULT NULL,
  `TEST_CASE_PARAM` varchar(50) DEFAULT NULL,
  `START_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `END_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DURATION` int(10) DEFAULT NULL,
  `ETL_TEST_CASE_CNT` int(10) DEFAULT NULL,
  `ETL_TEST_CASE_EXEC_CNT` int(10) DEFAULT NULL,
  `ETL_SUCCESS_CNT` int(10) DEFAULT NULL,
  `BI_TEST_CASE_CNT` int(10) DEFAULT NULL,
  `BI_TEST_CASE_EXEC_CNT` int(10) DEFAULT NULL,
  `BI_SUCCESS_CNT` int(10) DEFAULT NULL,
  `DWH_TEST_CASE_CNT` int(10) DEFAULT NULL,
  `DWH_TEST_CASE_EXEC_CNT` int(10) DEFAULT NULL,
  `DWH_SUCCESS_CNT` int(10) DEFAULT NULL,
  `ETL_JOB_CNT` int(10) DEFAULT NULL,
  `ETL_JOB_EXEC_CNT` int(10) DEFAULT NULL,
  `BI_REPORT_CNT` int(10) DEFAULT NULL,
  `BI_REPORT_EXEC_CNT` int(10) DEFAULT NULL,
  `BI_DASHBOARD_CNT` int(10) DEFAULT NULL,
  `BI_DASHBOARD_EXEC_CNT` int(10) DEFAULT NULL,
  `DWH_TABLE_CNT` int(10) DEFAULT NULL,
  `DWH_TABLE_EXEC_CNT` int(10) DEFAULT NULL,
  KEY `TEST_RUN_ID_INDEX` (`TEST_RUN_ID`),
  KEY `TEST_SUITE_NAME_INDEX` (`TEST_SUITE_NAME`),
  KEY `EXECUTED_BY_INDEX` (`EXECUTED_BY`),
  KEY `START_TIME_INDEX` (`START_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `lsm_ls_source_timezone` (
  `sourceid` int(11) DEFAULT NULL,
  `source_time_zone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_time_zone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_flag` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `is_customization` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `lsm_ls_entity_audit_enable_table` (
  `lsm_ls_entity_audit_enable_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_table_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `audit_columns` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_flag` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dw_inserted_on` datetime DEFAULT NULL,
  `is_customization` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lsm_ls_entity_audit_enable_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('1','alm_asset','install_status,substatus','Y',now(),'N');
INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('2','change_request','category,state,assignment_group,assigned_to,impact,urgency,severity,priority,type,scope,risk,review_status,reason,contact_type,opened_at,opened_by,end_date','Y',now(),'N');
INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('3','facilities','category,state,assignment_group,assigned_to,impact,urgency,priority,contact_type,opened_at,opened_by','Y',now(),'N');
INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('4','sc_req_item','assigned_to,priority','Y',now(),'N');
INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('5','incident','category,sub_category,state,assignment_group,assigned_to,impact,urgency,severity,priority,resolved_reason,contact_type,opened_at,opened_by,work_notes','Y',now(),'N');
INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('6','sc_request','assigned_to,priority,request_state,assignment_group','Y',now(),'N');
INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('7','problem_task','assigned_to,priority','Y',now(),'N');
INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('8','problem','assigned_to,priority','Y',now(),'N');
INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('9','sc_task','assigned_to,priority,category','Y',now(),'N');


INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('999','<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>','Y','N');
INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('0','<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>','Y','N');
INSERT INTO app_test.lsm_ls_entity_audit_enable_table VALUES('2','<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>','Y','N');
