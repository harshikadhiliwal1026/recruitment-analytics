# Recruitment Analytics Project: Process Efficiency, Funnel Conversion & Channel Effectiveness

An end-to-end HR & Talent Acquisition analytics project evaluating **801 job applications** across **8 departments**, **6 recruiters**, and **5 sourcing channels**. This project uses a non-overlapping tool architecture combining **Microsoft Excel**, **SQL**, and **Power BI** to diagnose hiring bottlenecks, candidate funnel drop-offs, and sourcing return on investment (ROI).

---

## Project Architecture & Tool Division

To maximize efficiency and avoid redundant calculations across tools, the analytical workload is divided cleanly:

| Tool | Scope & Problem Statement Covered | Deliverables |
| :--- | :--- | :--- |
| **Microsoft Excel** | **PS1:** Recruitment Process Efficiency<br>**PS2:** Recruitment Funnel & Candidate Conversion | `Excel findings.xlsx` (KPI cards, stage-duration breakdowns, recruiter/department comparisons, funnel tables, and written findings) |
| **SQL** | **PS3:** Recruitment Channel Effectiveness | `SQL.sql` (Relational queries evaluating channel application share, hires, conversion rates, and offer acceptance) |
| **Power BI** | **Executive Visualization (PS1, PS2 & PS3)** | Streamlined 3×2 Executive Dashboard (`Power BI Image.png`) integrating KPI cards, recruiter/department cycle times, funnel progression, exit outcomes, and channel ROI |

---

## Dataset Overview

* **Source File:** `recruitment_applications_revised_recruiter_specific_timeline.xlsx` (`Recruitment_Data` sheet)
* **Total Records:** `801` candidate applications
* **Dimensions:** `Department` (8), `Recruiter` (6), `Recruitment_Source` (5), `Experience_Level`, `Candidate_City`, `Job_Role`
* **Key Milestones Tracked:** `Application_Date` $\rightarrow$ `Screening_Date` $\rightarrow$ `Interview_Date` $\rightarrow$ `Final_Interview_Date` $\rightarrow$ `Offer_Date` $\rightarrow$ `Offer_Response_Date` $\rightarrow$ `Joining_Date`

---

## Key Analytical Findings

### 1. Recruitment Process Efficiency (Excel)
* **Overall Hiring Speed:** Out of **801** applications, **102** candidates joined (**12.73%** overall conversion) with an average **Time to Hire of 43.22 days** (median: **41.0 days**).
* **Recruiter Bottlenecks:** **Aditi Sharma** (**54.19 days**) and **Arjun Shah** (**53.21 days**) experience substantially longer hiring cycles than the remaining recruiter cohort (**Priya Nair** at `35.23d`, **Neha Verma** at `36.00d`, **Rahul Mehta** at `36.22d`, and **Karan Patel** at `36.56d`).
* **Department Cycle Times:** **Customer Support** (**48.46 days**) and **Operations** (**44.50 days**) take the longest to complete hiring, whereas **Marketing** (**41.33 days**) and **Sales** (**41.35 days**) close fastest.
* **Primary Stage Delays:** Excluding the **14.11-day** post-acceptance notice/onboarding window, the longest internal delays occur between **1st Interview and Final Round (`7.43 days`)** and **Screening and 1st Interview (`6.69 days`)**.

### 2. Recruitment Funnel & Candidate Conversion (Excel)

| Funnel Stage | Candidates | Stage-to-Stage Conversion | Cumulative Conversion | Stage Drop-off | Primary Exit Driver |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **Applied** | 801 | — | 100.0% | — | — |
| **Screened** | 801 | 100.0% | 100.0% | 0 | — |
| **1st Interview** | 521 | 65.0% | 65.0% | **280** | `Rejected - Assessment` (280) |
| **Final Round** | 253 | 48.6% | 31.6% | **268** | `Rejected - Interview` (268) |
| **Offer Made** | 147 | 58.1% | 18.4% | **106** | `Rejected - Final Round` (106) |
| **Offer Accepted** | 107 | 72.8% | 13.4% | **40** | `Offer Declined` (40) |
| **Joined (Hired)** | 102 | 95.3% | **12.7%** | **5** | `Offer Accepted - Did Not Join` (5) |

* **Largest Drop-Off:** The sharpest absolute volume drop occurs between **Screening and 1st Interview (`280` candidates, `35.0%` loss)** due to assessment rejections, followed closely by **1st Interview to Final Round (`268` candidates, `51.4%` stage attrition)**.

### 3. Recruitment Channel Effectiveness (SQL)

| Recruitment Source | Applications | App Share | Offers Made | Offers Accepted | Hires (Joined) | App-to-Hire Conv % | Offer Acceptance % |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **Naukri** | **228** | **28.46%** | 43 | 31 | **31** | 13.60% | 72.09% |
| **Employee Referral** | 136 | 16.98% | 33 | 28 | **27** | **19.85%** | **84.85%** |
| **LinkedIn** | 192 | 23.97% | 41 | 25 | 22 | 11.46% | 60.98% |
| **Company Career Page** | 131 | 16.35% | 17 | 12 | 11 | 8.40% | 70.59% |
| **Consultant** | 114 | 14.23% | 13 | 11 | 11 | 9.65% | 84.62% |

* **Volume Leader:** **Naukri** generates the highest application volume (`228`) and the highest total hires (`31`).
* **Efficiency Leader:** **Employee Referral** achieves the highest application-to-hire conversion (**19.85%**) and highest offer acceptance (**84.85%**), outperforming both **Naukri** (`13.60%`) and **LinkedIn** (`11.46%`).
* **High-Volume / Low-Yield Sources:** **LinkedIn** brings `192` applications (`23.97%` share) but converts only `22` hires (`11.46%`) due to a low **60.98%** offer acceptance rate. **Company Career Page** (`8.40%`) and **Consultant** (`9.65%`) also demonstrate low top-of-funnel conversion efficiency.

---

## Repository File Structure

```text
├── data/
│   └── recruitment_applications_revised_recruiter_specific_timeline.xlsx
├── excel/
│   └── Excel Findings.xlsx
├── sql/
│   └── SQL.sql
├── powerbi/
│   └── Power BI Image.png
└── README.md
```

---

## How to Reproduce

1. **Excel Analysis:** Open `Excel findings` to inspect the `Process_Efficiency`, `Funnel_Conversion`, and `Efficiency_Data` tabs, including dynamic formulas and summary findings.
2. **SQL Queries:** Load `Recruitment_Data` into a relational database (PostgreSQL, MySQL 8+, or SQL Server) and execute `SQL.sql` to reproduce the channel effectiveness metrics.
3. **Power BI Dashboard:** Connect Power BI Desktop to the dataset and build the 3×2 visual layout (Top KPI strip + Recruiter/Department Time-to-Hire bars, Funnel & Exit Status charts, and Applications vs. Hires & Conversion Rate charts).

---

## Strategic Recommendations

1. **Standardize Recruiter SLAs:** Audit scheduling workflows for **Aditi Sharma** and **Arjun Shah** to bring their `~53–54 day` hiring cycles closer to the `35–36 day` team benchmark.
2. **Expand Employee Referral Incentives:** Shift sourcing budget toward **Employee Referrals**, which convert at nearly **2×** the rate of LinkedIn and Career Page applications with an **84.85%** offer acceptance rate.
3. **Improve LinkedIn Candidate Alignment & Pre-Screening:** Address the **35.0%** assessment drop-off and **60.98%** LinkedIn offer acceptance rate through clearer compensation alignment early in screening.
