select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_application_project_c.qtrr_database_investment_id'  ELSE 'SUCCESS'  END as Message
from  bbandt_mdsdb.BBT_APP_DATA_NUMERIFY_final a11
join bbandt_mdwdb.f_application_project_c a12
on (CONCAT(COALESCE(a11.APPLICATION_DATABASE_ID,'UNSPECIFIED'),'~',COALESCE(a11.ASSOCIATED_Database_Investment_ID,'UNSPECIFIED'),
'~',COALESCE(a11.QTRR_Database_Investment_ID,'UNSPECIFIED'))=a12.row_id and a11.sourceinstance=a12.source_id)
left join bbandt_mdsdb.bbt_prj_data_qlkview_final a13
on (a11.ASSOCIATED_Investment_ID=a13.investment_id  and a11.sourceinstance=a13.sourceinstance)
left join bbandt_mdsdb.bbt_prj_data_qlkview_final a14
on (a11.QTRR_Investment_ID=a14.investment_id and a11.sourceinstance=a14.sourceinstance)
where coalesce(a14.Database_Investment_ID,'UNSPECIFIED')<>a12.qtrr_database_investment_id;