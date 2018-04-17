SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.closed_on_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM
  tjx_mdsdb.u_customer_service_final join
 tjx_mdwdb.f_customer_service_c on sys_id=row_id and sourceinstance=source_id
where (company_organization_c)<>trim(u_company_organization))temp;

