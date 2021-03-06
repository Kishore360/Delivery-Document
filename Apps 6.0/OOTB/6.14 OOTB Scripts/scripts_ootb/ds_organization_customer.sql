-- this query is been replaced with separate queries for each columns. Please refer separate queries instead of this.
drop table if exists app_test.ds_organization_customer;

create table app_test.ds_organization_customer 
SELECT 
 CONCAT('ORG_CUST~',A.sys_id )AS ROW_ID
, A.sourceinstance AS SOURCE_ID
, CONCAT('ORG_CUST~',A.parent) AS PARENT_ROW_ID
, A.name AS CUSTOMER_NUMBER
, A.name AS ORGANIZATION_NAME
, A.street AS ST_ADDRESS1
, NULL AS ST_ADDRESS2
, NULL AS ST_ADDRESS3
, NULL AS ST_ADDRESS4
, A.city AS CITY_CODE
, A.state AS STATE_CODE
, A.zip AS POSTAL_CODE
, A.country AS COUNTRY_CODE
, NULL AS REGION_CODE
, NULL AS EMAIL_ADDRESS
, A.phone AS WORK_PHONE
, A.fax_phone AS FAX_NUMBER
, NULL AS SECONDARY_WORK_PHONE
, NULL AS HOME_PAGE_URL
, NULL AS ORGANIZATION_REGISTRATION_NUMBER
, 'N' AS PROSPECT_FLAG
, 'N' AS SUPPLIER_FLAG
, 'N' AS COMPETITOR_FLAG
, 'N' AS ACCOUNT_FLAG
, NULL AS ACCOUNT_LOCATION
, NULL AS CUSTOMER_TYPE_CODE
, NULL AS CUSTOMER_CATEGORY_CODE
, NULL AS CUSTOMER_CURRENCY_CODE
, NULL AS BUSINESS_UNIT_NAME
, 'N' AS CHANNEL_FLAG
, NULL  AS DOMESTIC_UNIVERSAL_DUNS_NUMBER
, NULL AS DUNS_NUMBER
, NULL AS NUMBER_OF_EMPLOYEES
, CAST(NULL AS DATETIME) AS FORMED_DATE
, NULL AS GLOBAL_ULTIMATE_DUNS_NUMBER
, NULL AS LINE_OF_BUSINESS
, 'N' AS PARTNER_FLAG
, NULL AS PARENT_DUNS_NUMBER
, NULL AS PRIMARY_COMPETITOR_ID
, NULL AS PRIMARY_INDUSTRY_NAME
, NULL AS CUSTOMER_CLASS_CODE
, CAST(NULL AS SIGNED) AS CREDIT_SCORE
, NULL AS CUSTOMER_END_DATE
, NULL AS CUSTOMER_SINCE_DATE
, NULL AS KEY_COMPETITOR
, NULL AS TAX_IDENTIFICATION_TYPE
, NULL AS TAX_IDENTIFICATION_NUMBER
, NULL AS D_AND_B_SITE_NAME
, NULL AS D_AND_B_GLOBAL_NAME
, NULL AS D_AND_B_LEGAL_NAME
, 'N' AS SOLICITATION_FLAG
, 'N' AS DO_NOT_CALL_FLAG
, 'N' AS DO_NOT_EMAIL_FLAG
, 'N' AS DO_NOT_FAX_FLAG
, 'N' AS DO_NOT_MAIL_FLAG
, NULL AS PREFERRED_LANGUAGE
, 'Y' ORGANIZATION_ACTIVE_FLAG
, A.sys_created_by AS CREATED_BY
, A.sys_updated_by AS CHANGED_BY
, A.sys_created_on AS CREATED_ON
, A.sys_updated_on AS CHANGED_ON
, 'N' AS enduser_flag
, 'N' AS reseller_flag
, 'N' AS distributor_flag,
NULL AS customer_contact1_name,
NULL  AS  customer_contact2_name,
NULL AS  customer_contact3_name
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.core_company_final WHERE CDCTYPE<>'D') A where A.customer=1;
