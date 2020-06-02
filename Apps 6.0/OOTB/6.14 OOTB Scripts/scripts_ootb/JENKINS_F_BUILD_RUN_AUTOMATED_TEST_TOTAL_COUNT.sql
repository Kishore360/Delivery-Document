SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  f_build_run.AUTOMATED_TEST_TOTAL_COUNT' ELSE 'SUCCESS' END as Message
from
(SELECT SUM(coalesce(TR1.skipCount,TR.skipCount,0)+coalesce(TR1.passCount,TR.passCount,0)+coalesce(TR1.failCount,TR.failCount,0))
 AS totalCount,build.__numerify__primary_key
,build.sourceinstance  
				FROM #MDS_TABLE_SCHEMA.build_final build
            left outer join #MDS_TABLE_SCHEMA.testReport_final t
                on t.__numerify__parent_key = build.__numerify__primary_key
			 			 left outer join #MDS_TABLE_SCHEMA.testResult_final TR1
                on TR1.__numerify__parent_key = t.__numerify__primary_key	
        left outer join #MDS_TABLE_SCHEMA.testResult_final TR
                on TR.__numerify__parent_key = build.__numerify__primary_key
            group by build.__numerify__primary_key ,build.sourceinstance) SRC
  left join  #DWH_TABLE_SCHEMA.f_build_run TRG
on   SRC.__numerify__primary_key=TRG.ROW_ID
and SRC.sourceinstance=TRG.source_id
WHERE COALESCE(totalCount,'')<> COALESCE(TRG.AUTOMATED_TEST_TOTAL_COUNT,'')




