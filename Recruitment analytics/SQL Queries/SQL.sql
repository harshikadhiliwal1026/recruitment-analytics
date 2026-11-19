-- PS3 Master Query: Applications, Hires, Conversion & Offer Acceptance by Channel
SELECT
    recruitment_source,
    COUNT(*) AS total_applications,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS application_share_pct,
    SUM(CASE WHEN offer_made = 'Yes' THEN 1 ELSE 0 END) AS offers_made,
    SUM(CASE WHEN offer_accepted = 'Yes' THEN 1 ELSE 0 END) AS offers_accepted,
    SUM(CASE WHEN joined = 'Yes' THEN 1 ELSE 0 END) AS total_hires,
    ROUND(
        100.0 * SUM(CASE WHEN joined = 'Yes' THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0),
        2
    ) AS app_to_hire_conversion_pct,
    ROUND(
        100.0 * SUM(CASE WHEN offer_accepted = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN offer_made = 'Yes' THEN 1 ELSE 0 END), 0),
        2
    ) AS offer_acceptance_pct
FROM Recruitment_Data
GROUP BY recruitment_source
ORDER BY total_hires DESC, app_to_hire_conversion_pct DESC;

-- Focused Comparison: Employee Referral vs. LinkedIn and Naukri
SELECT
    recruitment_source,
    COUNT(*) AS applications,
    SUM(CASE WHEN joined = 'Yes' THEN 1 ELSE 0 END) AS hires,
    ROUND(100.0 * SUM(CASE WHEN joined = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS hire_rate_pct,
    ROUND(
        100.0 * SUM(CASE WHEN offer_accepted = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN offer_made = 'Yes' THEN 1 ELSE 0 END), 0),
        2
    ) AS offer_acceptance_pct
FROM Recruitment_Data
WHERE recruitment_source IN ('Employee Referral', 'LinkedIn', 'Naukri')
GROUP BY recruitment_source
ORDER BY hire_rate_pct DESC;