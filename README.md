# 🚚 Delivery Delay Analysis | Set A | Student ID: 10775

<p align="center">
<img src="https://capsule-render.vercel.app/api?type=waving&color=0:141E30,100:243B55&height=220&section=header&text=Delivery%20Delay%20Analysis&fontSize=42&fontColor=ffffff&animation=fadeIn&fontAlignY=35&desc=Excel%20%7C%20SQL%20%7C%20Python%20%7C%20Power%20BI&descAlignY=55&descSize=20" width="100%"/>
</p>

<p align="center">
<img src="https://img.shields.io/badge/Project-Delivery%20Delay%20Analysis-0078D4?style=for-the-badge"/>
<img src="https://img.shields.io/badge/Set-A-6C63FF?style=for-the-badge"/>
<img src="https://img.shields.io/badge/Student%20ID-10775-00A67E?style=for-the-badge"/>
<img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge"/>
</p>

<p align="center">
<a href="#-project-overview">
<img src="https://img.shields.io/badge/📊%20Project%20Overview-View-blue?style=for-the-badge"/>
</a>
<a href="#-key-findings">
<img src="https://img.shields.io/badge/🔍%20Findings-View-purple?style=for-the-badge"/>
</a>
<a href="#-power-bi-dashboard">
<img src="https://img.shields.io/badge/📈%20Power%20BI-Dashboard-orange?style=for-the-badge"/>
</a>
<a href="#-python-analysis">
<img src="https://img.shields.io/badge/🐍%20Python-Analysis-yellow?style=for-the-badge"/>
</a>
<a href="#-sql-analysis">
<img src="https://img.shields.io/badge/🗄️%20SQL-Queries-red?style=for-the-badge"/>
</a>
</p>

---

## 👋 About This Project

> **An end-to-end delivery delay analysis project built using Excel, SQL, Python and Power BI to identify the service type with the greatest delay burden and the hub requiring priority attention.**

This project analyzes delivery performance across:

- 🚚 Service Types
- 🏢 Hubs
- 🛣️ Routes
- 📅 Months
- ⏱️ Promised vs Actual Delivery Days

The same dataset and metric definitions are used across all four tools to maintain consistency and enable **cross-tool reconciliation**.

---

## 🎯 Project Overview

The main objective is to analyze delivery delays and answer two business questions:

### ❓ Business Questions

**1. Which service type has the greatest delivery-delay burden?**

**2. Which hub needs priority attention?**

### 📌 Delay Burden Definition

Delay burden is measured using:

```text
Total non-negative delay days
```

rather than delay incidence alone.

---

## 🧭 Quick Navigation

| Section | Description |
|---|---|
| 🎯 Objective | Business goal and questions |
| 📂 Dataset | Dataset and data dictionary |
| 🧹 Cleaning | Duplicate removal and transformations |
| 📊 Findings | Main analytical results |
| 📗 Excel | Excel analysis |
| 🗄️ SQL | SQL queries |
| 🐍 Python | Python analysis |
| 📈 Power BI | Interactive dashboard |
| 🔄 Reconciliation | Cross-tool validation |
| 🎥 Video | Project walkthrough |
| 📁 Repository | Project structure |

---

## 📂 Dataset

The project uses two CSV files:

| File | Location | Description | Rows |
|---|---|---|---:|
| `deliveries.csv` | `data/raw/deliveries.csv` | Delivery summary records | 13 |
| `routes.csv` | `data/raw/routes.csv` | Route/service lookup | 4 |

### ⚠️ Duplicate Handling

The original delivery dataset contains **13 rows**, including one exact duplicate.

After removing the duplicate:

**13 Raw Rows → 12 Clean Rows**

The raw dataset remains unchanged for auditability.

---

### 📦 Deliveries Data Dictionary

| Column | Type | Description |
|---|---|---|
| `record_id` | Integer | Delivery record identifier |
| `month` | Text | Reporting month |
| `route_id` | Text | Route lookup key |
| `hub` | Text | Delivery hub |
| `promised_days` | Numeric | Promised delivery duration |
| `actual_days` | Numeric | Actual delivery duration |

---

### 🛣️ Routes Data Dictionary

| Column | Type | Description |
|---|---|---|
| `route_id` | Text | Unique route identifier |
| `route` | Text | Route name |
| `service_type` | Text | Express / Standard |

#### Route Lookup

| Route ID | Route | Service Type |
|---|---|---|
| R1 | Metro Link | Express |
| R2 | City Dash | Express |
| R3 | Highway Freight | Standard |
| R4 | Rural Feeder | Standard |

---

## 🧹 Data Cleaning

The analytical workflow follows these steps:

```text
Raw deliveries.csv
       │
       ▼
13 Records
       │
       ▼
Remove Exact Duplicate
       │
       ▼
12 Unique Records
       │
       ▼
Join routes.csv
       │
       ▼
Add service_type
       │
       ▼
Calculate delay_days
       │
       ▼
Clean Analytical Dataset
```

### Cleaning Steps

- Preserve all 13 raw records.
- Remove the exact duplicate.
- Confirm 12 unique records remain.
- Convert numeric columns to numeric types.
- Use `route_id` as the lookup/join key.
- Merge delivery data with route data.
- Confirm zero unmatched route IDs.
- Preserve month order:

```text
Jan → Feb → Mar
```

---

## 🧮 Metric Definitions

### ⏱️ Delay Days

```text
delay_days = MAX(actual_days - promised_days, 0)
```

Early or on-time deliveries contribute:

```text
0 delay days
```

### 📊 Total Delay Days

```text
Total Delay Days = SUM(delay_days)
```

### 📈 Delay Incidence Rate

```text
Delay Incidence Rate =
Number of delayed records
------------------------
Total records
```

Example:

```text
9 delayed records ÷ 12 total records × 100
= 75.00%
```

---

## 🔥 Key Findings

### 📌 Overall Performance

| Metric | Result |
|---|---:|
| Clean Records | **12** |
| Delayed Records | **9** |
| Total Delay Days | **34.00** |
| Delay Incidence Rate | **75.00%** |

---

### 🥇 Finding 1 — Standard Service Has the Greatest Delay Burden

| Service Type | Records | Delayed Records | Total Delay | Incidence | Share |
|---|---:|---:|---:|---:|---:|
| 🟣 **Standard** | 6 | 5 | **22.00** | 83.33% | **64.71%** |
| 🔵 Express | 6 | 4 | 12.00 | 66.67% | 35.29% |
| **Overall** | **12** | **9** | **34.00** | **75.00%** | **100%** |

**💡 Insight:** Standard service contributes 22.00 of the overall 34.00 delay days. Therefore, Standard service has the greatest delivery-delay burden in this dataset.

---

### 🏢 Finding 2 — Mumbai Has the Highest Delay Burden

| Hub | Records | Total Delay | Incidence |
|---|---:|---:|---:|
| 🔴 **Mumbai** | 4 | **15.00** | 75.00% |
| 🟠 Delhi | 4 | 14.00 | 75.00% |
| 🟢 Chennai | 4 | 5.00 | 75.00% |

**💡 Insight:** Mumbai has the highest cumulative delay of 15.00 days. Mumbai represents:

```text
15 ÷ 34 × 100 = 44.12%
```

of the overall delay burden.

> All three hubs have the same 75.00% delay incidence rate. Mumbai is prioritized based on total delay burden, not a higher frequency of delayed records.

---

### 🛣️ Highest-Delay Route — 🚨 R4 Rural Feeder

| Metric | Value |
|---|---:|
| Route | Rural Feeder |
| Route ID | R4 |
| Total Delay | **14.00 days** |
| Share of Overall Delay | **41.18%** |

```text
14 ÷ 34 × 100 = 41.18%
```

---

### 📅 Monthly Delay Trend

| Month | Total Delay |
|---|---:|
| January | 8.00 |
| February | 9.00 |
| March | **17.00** |
| **Total** | **34.00** |

**📌 Observation:** March has the highest monthly delay burden with 17.00 delay days.

---

## 💡 Recommendation

> **Prioritize an operational review of Mumbai, with particular attention to Standard-service Rural Feeder route R4.**

R4 contributes:

```text
13.00 of Mumbai's 15.00 delay days
```

A review of route scheduling, hub handoffs and capacity could help identify potential operational causes.

⚠️ This recommendation is based on a small synthetic dataset and does not prove a specific root cause.

---

## 📗 Excel Analysis

**Workbook:** [`excel/analysis.xlsx`](excel/analysis.xlsx)

### Excel Sheets

| Sheet | Purpose |
|---|---|
| `Raw` | Original 13-row dataset |
| `Lookup` | Route lookup table |
| `Clean` | 12 unique records + calculations |
| `Summary` | Hub summary + PivotTable + chart |

### Excel Workflow

```text
Raw Data
   ↓
Remove Duplicate
   ↓
XLOOKUP route/service type
   ↓
Calculate delay_days
   ↓
SUMIFS by Hub
   ↓
PivotTable
   ↓
Chart
```

### Expected Hub Summary

| Hub | Delay Days |
|---|---:|
| Chennai | 5.00 |
| Delhi | 14.00 |
| Mumbai | **15.00** |

### Expected PivotTable

| Service Type | Jan | Feb | Mar | Total |
|---|---:|---:|---:|---:|
| Express | 1.00 | 3.00 | 8.00 | **12.00** |
| Standard | 7.00 | 6.00 | 9.00 | **22.00** |
| **Total** | **8.00** | **9.00** | **17.00** | **34.00** |

---

## 🗄️ SQL Analysis

**SQL Files:** [`setup.sql`](sql/setup.sql) · [`queries.sql`](sql/queries.sql)

### Execution Order

```text
1️⃣ Create Database
      ↓
2️⃣ Run setup.sql
      ↓
3️⃣ Verify 12 deliveries
      ↓
4️⃣ Verify 4 routes
      ↓
5️⃣ Run queries.sql
      ↓
6️⃣ Export results
```

### SQL Questions

| Query | Purpose |
|---|---|
| S2a | Total delay by service type |
| S2b | Routes with total delay > 8 |
| S2c | Top two hubs by total delay |

### Expected Results

**S2a**

| Service Type | Total Delay |
|---|---:|
| Standard | **22.00** |
| Express | 12.00 |

**S2b**

| Route | Delay |
|---|---:|
| R4 — Rural Feeder | **14.00** |
| R1 — Metro Link | 9.00 |

**S2c**

| Hub | Delay |
|---|---:|
| Mumbai | **15.00** |
| Delhi | 14.00 |

### Lookup Integrity Check

```sql
SELECT COUNT(*) AS unmatched_fact_rows
FROM deliveries AS d
LEFT JOIN routes AS r
ON d.route_id = r.route_id
WHERE r.route_id IS NULL;
```

Expected:

```text
unmatched_fact_rows = 0
```

---

## 🐍 Python Analysis

**Entry Point:** [`python/analysis.py`](python/analysis.py)

### Workflow

```text
Load CSV files
      ↓
Check data types
      ↓
Remove duplicate
      ↓
Merge on route_id
      ↓
Assert 12 rows
      ↓
Check missing service_type
      ↓
Calculate delay_days
      ↓
Service summary
      ↓
Route analysis
      ↓
Monthly chart
      ↓
Export outputs
```

### Delay Calculation

```python
df["delay_days"] = (
    df["actual_days"] - df["promised_days"]
).clip(lower=0)
```

### Run

```bash
python python/analysis.py
```

### Python Outputs

| File | Description |
|---|---|
| `outputs/clean_data.csv` | Clean merged dataset |
| `outputs/python_summary.csv` | Service-level summary |
| `outputs/python_chart.png` | Monthly delay chart |

### 📊 Python Chart

<p align="center">
<img src="outputs/python_chart.png" alt="Monthly Delivery Delay Chart" width="850"/>
</p>

---

## 📈 Power BI Dashboard

**Dashboard File:** [`powerbi/dashboard.pbix`](powerbi/dashboard.pbix)

### Power BI Model

```text
routes
   │
   │ 1
   │
   ▼
deliveries
   *
```

Relationship:

```text
routes[route_id] 1 ─────── * deliveries[route_id]
```

### 📌 Required KPI Cards

- 📦 Delivery Count
- ⏱️ Total Delay Days
- 📊 Delay Incidence Rate

### 📊 Required Visuals

- Total Delay by Service Type
- Monthly Delay Trend
- Hub Slicer
- KPI Cards

### 🧮 DAX Measures

**Delivery Count**
```dax
Delivery Count =
COUNTROWS(deliveries)
```

**Total Delay Days**
```dax
Total Delay Days =
SUMX(
    deliveries,
    MAX(
        deliveries[actual_days] - deliveries[promised_days],
        0
    )
)
```

**Delay Incidence Rate**
```dax
Delay Incidence Rate =
DIVIDE(
    COUNTROWS(
        FILTER(
            deliveries,
            deliveries[actual_days] > deliveries[promised_days]
        )
    ),
    COUNTROWS(deliveries),
    0
)
```

Format `Delay Incidence Rate` as percentage with two decimal places.

---

## 🎛️ Power BI Slicer Validation

**Unfiltered**

| KPI | Expected |
|---|---:|
| Delivery Count | **12** |
| Total Delay Days | **34.00** |
| Delay Incidence Rate | **75.00%** |

**Mumbai Selected**

| KPI | Expected |
|---|---:|
| Delivery Count | **4** |
| Total Delay Days | **15.00** |
| Delay Incidence Rate | **75.00%** |

### Dashboard Screenshot

<p align="center">
<img src="outputs/powerbi_dashboard.png" alt="Power BI Dashboard" width="950"/>
</p>

---

## 🔄 Cross-Tool Reconciliation

**Selected Aggregate:** Standard Service — Total Delay Days

```text
R3 = 3 + 5 + 0 = 8.00
R4 = 4 + 1 + 9 = 14.00
Standard = 8.00 + 14.00
Standard Total = 22.00
```

| Tool | Expected Value |
|---|---:|
| Excel | **22.00** |
| SQL | **22.00** |
| Python | **22.00** |
| Power BI | **22.00** |

### ✅ Reconciliation Result

```text
Excel    → 22.00
SQL      → 22.00
Python   → 22.00
Power BI → 22.00
```

**All four tools reconcile to the same Standard-service delay total.**

---

## 📁 Repository Structure

```text
Data_Analysis_Set_A_10775/
│
├── README.md
├── requirements.txt
├── .gitignore
│
├── data/
│   └── raw/
│       ├── deliveries.csv
│       └── routes.csv
│
├── excel/
│   └── analysis.xlsx
│
├── sql/
│   ├── setup.sql
│   └── queries.sql
│
├── python/
│   └── analysis.py
│
├── powerbi/
│   └── dashboard.pbix
│
└── outputs/
    ├── clean_data.csv
    ├── python_summary.csv
    ├── python_chart.png
    ├── powerbi_dashboard.png
    │
    └── sql/
        ├── s2a_delay_by_service_type.csv
        ├── s2b_routes_with_significant_delay.csv
        └── s2c_top_two_hubs.csv
```

---

## ⚙️ Environment Setup

**1. Clone Repository**
```bash
git clone https://github.com/DevanshiCodesAI/Data_Analysis_Set_A_10775.git
cd Data_Analysis_Set_A_10775
```

**2. Create Virtual Environment**
```bash
python -m venv .venv
```

**3. Activate**

Windows:
```bat
.venv\Scripts\activate
```

macOS / Linux:
```bash
source .venv/bin/activate
```

**4. Install Requirements**
```bash
python -m pip install -r requirements.txt
```

---

## 🧰 Tools Used

<p align="center">
<img src="https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white"/>
<img src="https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white"/>
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
<img src="https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white"/>
<img src="https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black"/>
</p>

### Version Information

| Tool | Version |
|---|---|
| Excel | Update with actual version |
| Power BI Desktop | Update with actual version |
| SQL | Update with actual engine/version |
| Python | Update with actual version |
| pandas | Update with actual version |
| matplotlib | Update with actual version |

---

## 📦 Requirements

`requirements.txt`:
```text
pandas
matplotlib
```

Install:
```bash
pip install -r requirements.txt
```

---

## 🎥 Project Walkthrough

<p align="center">
<a href="#">
<img src="https://img.shields.io/badge/▶️%20WATCH%20PROJECT%20WALKTHROUGH-FF0000?style=for-the-badge&logo=youtube&logoColor=white"/>
</a>
</p>

### Video Requirements

The walkthrough should cover:

- 👋 Introduction + Student ID + Set A
- 📂 Dataset and duplicate
- 📗 Excel lookup and PivotTable
- 🗄️ SQL query
- 🐍 Python cleaning and validation
- 📈 Power BI dashboard
- 🎯 Two findings
- 💡 Recommendation
- ⚠️ Limitation
- 📁 GitHub repository structure

**Duration:** 5–10 minutes
**Video URL:** `ADD_YOUR_PUBLIC_VIDEO_URL_HERE`

---

## ⚠️ Limitations

- Dataset is synthetic.
- Only 12 unique analytical records are available.
- Data covers only three months.
- Each row represents a route/hub summary.
- Delay days do not represent unique parcels.
- Root causes such as staffing, weather, capacity and traffic are not included.
- Results should not automatically be generalized to a larger operation.

---

## 📚 References

- [Microsoft Excel Support](https://support.microsoft.com/en-us/excel)
- [pandas Documentation](https://pandas.pydata.org/docs/)
- [Matplotlib Documentation](https://matplotlib.org/stable/)
- [Microsoft Power BI Documentation](https://learn.microsoft.com/en-us/power-bi/)
- [DAX Documentation](https://learn.microsoft.com/en-us/dax/)
- SQL engine documentation used for the project

---

## 👩‍💻 Author

<p align="center">

### Devanshi Bachhote

**BCA Student | Data Analysis | AI/ML & Data Science Learner**

<a href="https://github.com/DevanshiCodesAI">
<img src="https://img.shields.io/badge/GitHub-DevanshiCodesAI-181717?style=for-the-badge&logo=github"/>
</a>

<a href="https://www.linkedin.com/in/devanshi-bachhote-07235b418/">
<img src="https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin"/>
</a>

<a href="https://devanshibachhote.lovable.app/">
<img src="https://img.shields.io/badge/Portfolio-Visit-6C63FF?style=for-the-badge"/>
</a>

</p>

---

## 📝 Authorship Declaration

> **All work in this repository is my own except where cited.**

---

## ✅ Final Submission Checklist

- [x] Project title and Student ID included
- [x] Set A identified
- [x] Business questions documented
- [x] Dataset documented
- [x] Duplicate handling documented
- [x] Metric definitions included
- [x] Excel workflow documented
- [x] SQL workflow documented
- [x] Python workflow documented
- [x] Power BI workflow documented
- [x] Numeric findings included
- [x] Recommendation included
- [x] Cross-tool reconciliation included
- [x] Limitations included
- [ ] Actual software versions verified
- [ ] Actual Power BI screenshot added
- [ ] Final video URL added
- [ ] Video tested while signed out
- [ ] Final Git commit hash recorded

---

## 🚀 Project Summary

```text
                    DELIVERY DELAY ANALYSIS
                             │
             ┌───────────────┼───────────────┐
             │               │               │
           EXCEL            SQL            PYTHON
             │               │               │
             └───────────────┼───────────────┘
                             │
                         POWER BI
                             │
                             ▼
                  ┌────────────────────┐
                  │  KEY INSIGHTS      │
                  ├────────────────────┤
                  │ Standard → 22 days │
                  │ Mumbai → 15 days   │
                  │ R4 → 14 days       │
                  │ March → 17 days    │
                  └────────────────────┘
```

### ⭐ Final Result

**Standard service:** 22.00 total delay days
**Mumbai hub:** 15.00 total delay days
**R4 Rural Feeder:** 14.00 total delay days
**March:** 17.00 total delay days
**Overall:** 34.00 total delay days with a 75.00% delay incidence rate.

---

<p align="center">
<img src="https://capsule-render.vercel.app/api?type=waving&color=0:243B55,100:141E30&height=120&section=footer" width="100%"/>

### ⭐ If you found this project useful, consider giving the repository a star!

</p>
