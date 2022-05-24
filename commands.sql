--  Counting all unique active deals
SELECT COUNT(DISTINCT deal_id) FROM sample
WHERE from_stage NOT IN ('Closed Lost','closedlost', 'Closed Won','Closed Won - QA', 'Dead - No Decision', 'Dead - No opportunity', 'Closed Booked', 'Closed - Not pursued', 'Closed - Lost to competitor');


-- how many active unique deals were in campaigns
SELECT COUNT(DISTINCT deal_id) FROM sample
WHERE _people_targeted > 0
AND sub_lead_source NOT IN ('Personal Network', 'Investor Referral', 'Met at Event', 'Customer Referral', 'Direct traffic', 'Organic search', 'Marketplace Partner', 'Public Info', 'Referring Websites', 'Social media', 'Sales Partner')
AND from_stage NOT IN ('Closed Lost','closedlost', 'Closed Won','Closed Won - QA', 'Dead - No Decision', 'Dead - No opportunity', 'Closed Booked', 'Closed - Not pursued', 'Closed - Lost to competitor');


-- Unique deals that were influenced by Influ2 according to my criteria
SELECT COUNT(DISTINCT deal_id) FROM sample
WHERE _people_targeted > 0
AND max_imp_score > 0
AND Influ2_BG_score > 0
AND sub_lead_source NOT IN ('Personal Network', 'Investor Referral', 'Met at Event', 'Customer Referral', 'Direct traffic', 'Organic search', 'Marketplace Partner', 'Public Info', 'Referring Websites', 'Social media', 'Sales Partner')
AND from_stage IN ('1 - Discovery', '2 - Deep Dive/Demo', '3 - Evaluation', '4 - Negotiations', '5 - Commit', 'Closed Rejected');


-- checking start point deal stages
SELECT COUNT(deal_id) FROM sample
WHERE _people_targeted > 0
AND max_imp_score > 0
AND Influ2_BG_score > 0
AND sub_lead_source NOT IN ('Personal Network', 'Investor Referral', 'Met at Event', 'Customer Referral', 'Direct traffic', 'Organic search', 'Marketplace Partner', 'Public Info', 'Referring Websites', 'Social media', 'Sales Partner')
AND from_stage = 'Closed Rejected';
-- '2 - Deep Dive/Demo', '3 - Evaluation', '4 - Negotiations', '5 - Commit', 'Closed Rejected');


-- checkind end point deal stages
SELECT deal_id FROM sample
WHERE _people_targeted > 0
AND max_imp_score > 0
AND Influ2_BG_score > 0
AND sub_lead_source NOT IN ('Personal Network', 'Investor Referral', 'Met at Event', 'Customer Referral', 'Direct traffic', 'Organic search', 'Marketplace Partner', 'Public Info', 'Referring Websites', 'Social media', 'Sales Partner')
AND from_stage IN ('1 - Discovery', '2 - Deep Dive/Demo', '3 - Evaluation', '4 - Negotiations', '5 - Commit', 'Closed Rejected')
And to_stage = 'Closed Won - QA';
