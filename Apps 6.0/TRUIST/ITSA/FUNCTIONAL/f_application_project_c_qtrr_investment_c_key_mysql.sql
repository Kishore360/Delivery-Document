select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_application_project_c.qtrr_investment_c_key'  ELSE 'SUCCESS'  END as Message
from  truist_mdsdb.BBT_APP_DATA_NUMERIFY_final a11
join truist_mdwdb.f_application_project_c a12
on (CONCAT(COALESCE(a11.APPLICATION_DATABASE_ID,'UNSPECIFIED'),'~',COALESCE(a11.ASSOCIATED_Database_Investment_ID,'UNSPECIFIED'),
'~',COALESCE(a11.QTRR_Database_Investment_ID,
                'UNSPECIFIED'))=a12.row_id and a11.sourceinstance=a12.source_id)
left join truist_mdsdb.bbt_prj_data_qlkview_final a13
on (a11.ASSOCIATED_Investment_ID=a13.investment_id  and a11.sourceinstance=a13.sourceinstance)
join truist_mdwdb.d_clarity_project_c a14
on (COALESCE(a11.QTRR_Investment_ID,'UNSPECIFIED')=a14.row_id )
where coalesce(a14.row_key, case when a11.QTRR_Investment_ID is null then 0 else -1 end)<>a12.qtrr_investment_c_key
and a11.cdctype<>'D';