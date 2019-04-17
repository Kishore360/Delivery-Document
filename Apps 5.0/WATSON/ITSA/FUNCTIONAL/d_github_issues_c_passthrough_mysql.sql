SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_state_c' ELSE 'SUCCESS' END as Message
 FROM     watson_mdsdb.u_github_issues_final s
left join  watson_mdwdb.d_github_issues_c t on s.sys_id=t.row_id and s.sourceinstance=t.source_id
where 
t.status_c<>coalesce(s.u_status,'UNSPECIFIED') or 
t.issue_link_c<>s.u_issue_link or 
t.labels_c<>coalesce(s.u_labels,'UNSPECIFIED') or 
t.tempcomment_c<>s.u_tempcomment or 
t.title_c<>s.u_title or 
t.user_c<>coalesce(s.u_user,'UNSPECIFIED') or 
t.will_add_existing_issue_link_flag_c<>case when s.u_will_add_existing_issue_link=1 then 'Y' else 'N' end  or 
t.add_comment_c<>coalesce(s.u_add_comment,'UNSPECIFIED') or 
t.api_link_c<>s.u_api_link or 
t.body_c<>s.u_body or 
t.description_c<>s.u_description or 
t.html_4_c<>s.u_html_4