# 🏥 Hospital Patient Analytics - End-to-End Data Analysis Project




## 🎯 Project Overview

This is a **comprehensive end-to-end data analytics project** that analyzes hospital patient data to provide actionable insights for healthcare management. The project demonstrates the complete data analytics pipeline from raw data collection to interactive dashboard creation.

**Project Duration:** 2 weeks  
**Industry:** Healthcare Analytics  
**Dataset Size:** 1,200+ patient records  
**Time Period:** January 2023 - December 2024


## 💼 Business Problem

A hospital management system faces several challenges:

1. **Revenue Optimization** - Understanding which departments and services generate the most revenue
2. **Resource Allocation** - Determining optimal staff and bed capacity distribution
3. **Patient Flow Management** - Analyzing admission patterns and length of stay
4. **Cost Control** - Identifying high-cost treatments and insurance coverage gaps
5. **Performance Monitoring** - Evaluating doctor and department efficiency
6. **Strategic Planning** - Making data-driven decisions for hospital expansion

### Business Questions Answered:
- Which departments generate the highest revenue?
- What is the average treatment cost per patient?
- How does insurance coverage impact hospital revenue?
- What are the peak admission periods?
- Which doctors handle the most patients?
- What is the average length of hospital stay?
- How do emergency admissions compare to elective procedures?
- What is the discharge success rate?

---

## 📊 Dataset Information

### Dataset Overview
- **Total Records:** 1,200 patient admissions
- **Time Range:** January 2023 - December 2024 (2 years)
- **Columns:** 19 attributes
- **File Format:** CSV
- **Size:** ~250 KB

### Data Dictionary

| Column Name | Data Type | Description | Sample Values |
|------------|-----------|-------------|---------------|
| `Patient_ID` | String | Unique patient identifier | P00001, P00002 |
| `Patient_Name` | String | Patient's full name | John Smith, Emma Johnson |
| `Age` | Integer | Patient age in years | 25, 67, 42 |
| `Gender` | String | Patient gender | Male, Female |
| `Blood_Group` | String | Patient blood type | A+, O-, B+, AB- |
| `Admission_Date` | Date | Hospital admission date | 2023-05-15, 2024-03-22 |
| `Discharge_Date` | Date | Hospital discharge date | 2023-05-20, 2024-03-28 |
| `Days_Stayed` | Integer | Length of hospital stay | 1-30 days |
| `Department` | String | Hospital department | Cardiology, Neurology, Emergency |
| `Doctor_Name` | String | Attending physician | Dr. James Miller, Dr. Sarah Chen |
| `Diagnosis` | String | Primary diagnosis | Heart Attack, Fracture, Diabetes |
| `Admission_Type` | String | Type of admission | Emergency, Elective, Urgent |
| `Discharge_Status` | String | Patient discharge status | Discharged, Transferred, Admitted |
| `Follow_Up_Required` | String | Follow-up needed | Yes, No |
| `Treatment_Cost` | Decimal | Total treatment cost ($) | $2,500.00, $15,750.00 |
| `Insurance_Type` | String | Insurance provider type | Medicare, Private, Self-Pay |
| `Insurance_Coverage_Percent` | Decimal | Coverage percentage | 0-100% |
| `Medication_Prescribed` | Integer | Number of medications | 1-8 |
| `Lab_Tests_Count` | Integer | Number of lab tests | 1-15 |

### Departments Included
- 🫀 **Cardiology** - Heart-related conditions
- 🧠 **Neurology** - Brain and nervous system
- 🦴 **Orthopedics** - Bone and joint issues
- 👶 **Pediatrics** - Children's health
- 🚨 **Emergency** - Urgent care
- 🏥 **General Medicine** - General healthcare

---

## 🛠️ Tools & Technologies

### Data Collection & Generation
- **Excel** - Initial data exploration and validation

### Data Cleaning & Transformation
- **Python 3.8+** - Primary programming language
  - `pandas` - Data manipulation and cleaning
  - `numpy` - Numerical operations
  - `datetime` - Date parsing and manipulation

### Data Analysis
- **SQL (MySQL)* - Complex queries and aggregations
  - Window functions
  - CTEs (Common Table Expressions)
  - Subqueries
  - CASE statements

### Data Visualization
- **Power BI Desktop** - Interactive dashboard creation
  - DAX (Data Analysis Expressions)
  - Time Intelligence
  - Calculated Columns and Measures
  - Custom Visualizations


---

## 🏗️ Project Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    RAW DATA GENERATION                      │
│                  (Messy CSV with Issues)                    │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│              DATA EXPLORATION (Excel)                       │
│    • Identify data quality issues                          │
│    • Understand data structure                             │
│    • Initial statistical analysis                          │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│           DATA CLEANING (Python/Pandas)                     │
│    • Handle missing values                                 │
│    • Standardize date formats                              │
│    • Remove duplicates                                     │
│    • Fix data types                                        │
│    • Create calculated columns                             │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│              DATA ANALYSIS (SQL)                            │
│    • Revenue analysis                                      │
│    • Department performance                                │
│    • Patient demographics                                  │
│    • Time-based trends                                     │
│    • Doctor performance metrics                            │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│         DATA VISUALIZATION (Power BI)                       │
│    • Interactive dashboards                                │
│    • KPI cards                                            │
│    • Trend analysis                                       │
│    • Drill-down capabilities                              │
└─────────────────────────────────────────────────────────────┘
```

---

## ✨ Key Features

### 🧹 Data Cleaning Excellence
- ✅ Handled 120+ missing values across multiple columns
- ✅ Standardized 3 different date formats to ISO format
- ✅ Removed special characters from numeric fields
- ✅ Fixed inconsistent categorical values
- ✅ Created 10+ calculated columns for deeper analysis

### 📈 Comprehensive SQL Analysis
- ✅ 20+ complex SQL queries
- ✅ Revenue analysis by multiple dimensions
- ✅ Time-series trend analysis
- ✅ Performance metrics calculation
- ✅ Advanced aggregations and window functions

### 📊 Professional Power BI Dashboard
- ✅ 54+ DAX measures for comprehensive metrics
- ✅ 6 calculated columns for categorization
- ✅ 5 interactive dashboard pages
- ✅ Time intelligence calculations (YoY, MoM, QoQ)
- ✅ Dynamic filtering and drill-through capabilities

---

## 💻 Installation & Setup

### Prerequisites
```bash
# Python 3.8 or higher
python --version

# Required Python packages
pip install pandas numpy openpyxl
```

### Clone the Repository
```bash
git clone https://github.com/yourusername/hospital-patient-analytics.git
cd hospital-patient-analytics
```



## 🔄 Project Workflow

### Phase 1: Data Generation & Exploration
1. Generate messy dataset with realistic data quality issues
2. Perform initial exploration in Excel
3. Document data quality problems
4. Create data cleaning strategy

### Phase 2: Data Cleaning (Python)
```python
# Key cleaning steps performed:
1. Remove extra whitespaces from column names
2. Handle missing values (median, mode, custom fill)
3. Standardize date formats (MM/DD/YYYY, DD/MM/YYYY → YYYY-MM-DD)
4. Remove currency symbols and percentage signs
5. Fix negative values in numeric columns
6. Standardize categorical values (Yes/Y/TRUE → Yes)
7. Remove duplicate records
8. Create calculated columns (Age_Group, Revenue_Category, etc.)
9. Export cleaned data
```

### Phase 3: SQL Analysis
```sql
-- Performed 20+ analysis queries including:
1. Revenue analysis by department
2. Monthly and quarterly trends
3. Doctor performance metrics
4. Insurance coverage analysis
5. Patient demographic breakdowns
6. Admission pattern analysis
7. High-cost patient identification
8. Year-over-year comparisons
```

### Phase 4: Power BI Visualization
```
1. Import cleaned data
2. Create Date table and relationships
3. Build 54+ DAX measures
4. Add 6 calculated columns
5. Design 5 dashboard pages
6. Apply formatting and themes
7. Add interactivity (slicers, drill-through)
8. Test and validate
```

---

## 🧹 Data Cleaning Process

### Issues Identified in Raw Data

| Issue Type | Count | Example | Resolution |
|-----------|-------|---------|------------|
| Missing Values | 120+ | Empty cells in Patient_Name | Filled with 'Unknown Patient' |
| Date Format Issues | 300+ | 05/15/2023, 2023-05-15, 15/05/2023 | Standardized to YYYY-MM-DD |
| Extra Whitespaces | 200+ | "  Cardiology  " | Stripped using str.strip() |
| Currency Symbols | 50+ | "$12,500.00" | Removed symbols, converted to float |
| Percentage Signs | 60+ | "75%" | Removed sign, converted to decimal |
| Negative Values | 25+ | -45 (in Age column) | Converted to absolute values |
| Inconsistent Categories | 100+ | Yes/Y/TRUE, Male/M | Standardized to single format |
| Data Type Errors | 50+ | Age stored as text | Converted to appropriate types |

### Cleaning Statistics

```
📊 Before Cleaning:
- Total Rows: 1,200
- Total Columns: 19
- Missing Values: 120+
- Data Quality Issues: 800+
- Duplicates: 0

✅ After Cleaning:
- Total Rows: 1,200
- Total Columns: 29 (added 10 calculated columns)
- Missing Values: 0
- Data Quality Issues: 0
- Duplicates: 0
- Data Quality Score: 100%
```

### Key Python Code Snippets

```python
# Standardize date formats
def parse_mixed_dates(date_series):
    parsed_dates = []
    for date_str in date_series:
        if pd.isna(date_str):
            parsed_dates.append(pd.NaT)
        else:
            for fmt in ['%m/%d/%Y', '%Y-%m-%d', '%d/%m/%Y']:
                try:
                    parsed_dates.append(pd.to_datetime(date_str, format=fmt))
                    break
                except:
                    continue
    return pd.Series(parsed_dates)

# Create age groups
df['Age_Group'] = pd.cut(df['Age'], 
                         bins=[0, 18, 35, 50, 65, 100], 
                         labels=['0-18', '19-35', '36-50', '51-65', '65+'])

# Calculate insurance paid amount
df['Insurance_Paid'] = (df['Treatment_Cost'] * df['Insurance_Coverage_Percent'] / 100).round(2)
```

---

## 🔍 SQL Analysis

### Top 5 Most Important Queries

#### 1. Revenue Analysis by Department
```sql
SELECT 
    Department,
    COUNT(*) AS Total_Patients,
    SUM(Treatment_Cost) AS Total_Revenue,
    AVG(Treatment_Cost) AS Avg_Revenue_Per_Patient,
    ROUND(100.0 * SUM(Treatment_Cost) / 
          (SELECT SUM(Treatment_Cost) FROM hospital_patients), 2) AS Revenue_Percentage
FROM hospital_patients
GROUP BY Department
ORDER BY Total_Revenue DESC;
```

#### 2. Monthly Trend Analysis
```sql
SELECT 
    YEAR(Admission_Date) AS Year,
    MONTH(Admission_Date) AS Month,
    MONTHNAME(Admission_Date) AS Month_Name,
    COUNT(*) AS Total_Admissions,
    SUM(Treatment_Cost) AS Monthly_Revenue,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay
FROM hospital_patients
GROUP BY YEAR(Admission_Date), MONTH(Admission_Date), MONTHNAME(Admission_Date)
ORDER BY Year, Month;
```

#### 3. Doctor Performance Metrics
```sql
SELECT 
    Doctor_Name,
    Department,
    COUNT(*) AS Total_Patients,
    SUM(Treatment_Cost) AS Revenue_Generated,
    AVG(Treatment_Cost) AS Avg_Revenue_Per_Patient,
    AVG(Days_Stayed) AS Avg_Patient_Stay,
    ROUND(100.0 * COUNT(CASE WHEN Follow_Up_Required = 'Yes' THEN 1 END) / COUNT(*), 2) AS Follow_Up_Rate
FROM hospital_patients
GROUP BY Doctor_Name, Department
ORDER BY Revenue_Generated DESC;
```

#### 4. Insurance Coverage Analysis
```sql
SELECT 
    Insurance_Type,
    COUNT(*) AS Total_Patients,
    AVG(Insurance_Coverage_Percent) AS Avg_Coverage,
    SUM(Treatment_Cost) AS Total_Treatment_Cost,
    SUM(Treatment_Cost * Insurance_Coverage_Percent / 100) AS Insurance_Paid,
    SUM(Treatment_Cost * (100 - Insurance_Coverage_Percent) / 100) AS Patient_Paid
FROM hospital_patients
GROUP BY Insurance_Type
ORDER BY Total_Patients DESC;
```

#### 5. Year-over-Year Comparison
```sql
SELECT 
    YEAR(Admission_Date) AS Year,
    COUNT(*) AS Total_Patients,
    SUM(Treatment_Cost) AS Total_Revenue,
    AVG(Treatment_Cost) AS Avg_Cost_Per_Patient,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay
FROM hospital_patients
GROUP BY YEAR(Admission_Date)
ORDER BY Year;
```

### Analysis Categories

- **Financial Analysis** (5 queries)
- **Operational Metrics** (4 queries)
- **Performance Analysis** (4 queries)
- **Demographic Analysis** (4 queries)
- **Time-Based Analysis** (3 queries)

---

## 📊 Power BI Dashboard

### Dashboard Pages

#### 📈 Page 1: Executive Overview
**Purpose:** High-level KPIs for executive decision-making

**Key Metrics:**
- Total Revenue: $XX,XXX,XXX
- Total Patients: 1,200+
- Average Treatment Cost: $X,XXX
- Average Length of Stay: X.X days
- Discharge Success Rate: XX%
- Follow-up Rate: XX%

**Visualizations:**
- Line chart: Monthly revenue trend
- Donut chart: Revenue by department
- Bar chart: Top 10 diagnoses
- Stacked column: Insurance type distribution
- KPI cards: Key performance indicators

#### 💰 Page 2: Financial Analysis
**Purpose:** Deep dive into revenue and cost structure

**Key Metrics:**
- Total Insurance Paid vs Out-of-Pocket
- Revenue by Insurance Type
- High-Cost Patient Analysis
- Revenue per Patient Day
- Insurance Coverage Rate

**Visualizations:**
- Waterfall chart: Revenue breakdown
- 100% stacked bar: Insurance vs OOP by department
- Table: Top 10 high-cost patients
- Gauge: Insurance coverage target
- Line chart: Revenue trend with forecast

#### 🏥 Page 3: Department Performance
**Purpose:** Departmental efficiency and productivity

**Key Metrics:**
- Revenue by Department
- Patient Volume
- Average Cost per Patient
- Average Length of Stay
- Discharge Success Rate

**Visualizations:**
- Matrix table: Department performance metrics
- Scatter plot: Cost vs Length of Stay
- Stacked bar: Admissions by type
- Treemap: Patient distribution
- Heatmap: Monthly workload

#### 👥 Page 4: Patient Demographics
**Purpose:** Understanding patient population

**Key Metrics:**
- Age Distribution
- Gender Breakdown
- Blood Group Analysis
- Admission Type Patterns

**Visualizations:**
- Pie chart: Gender distribution
- Column chart: Patients by age group
- Donut chart: Blood group distribution
- Clustered bar: Age group by department
- Line chart: Monthly admissions

#### ⏰ Page 5: Time Intelligence
**Purpose:** Trend analysis and forecasting

**Key Metrics:**
- YoY Revenue Growth
- MoM Change
- QoQ Comparison
- Rolling 3-Month Average

**Visualizations:**
- Line chart: Revenue with YoY comparison
- Column chart: Quarterly performance
- Area chart: Cumulative revenue
- Cards: YTD, QTD, MTD metrics
- Table: Time-based comparisons

### DAX Measures Summary

**Total Measures Created:** 54+

**Categories:**
1. **Basic Aggregations** (6 measures)
   - Total Patients, Total Revenue, Avg Cost, etc.

2. **Financial Metrics** (8 measures)
   - Insurance Paid, Out-of-Pocket, Revenue per Patient, etc.

3. **Patient Metrics** (14 measures)
   - Demographics, Admissions, Discharge rates, etc.

4. **Time Intelligence** (11 measures)
   - YoY, MoM, QoQ, YTD, QTD, MTD, etc.

5. **Comparative Analysis** (7 measures)
   - Rankings, Percentages, Benchmarks, etc.

6. **Advanced KPIs** (8 measures)
   - Efficiency scores, Growth rates, etc.

### Key DAX Formulas

```dax
// Total Revenue
Total Revenue = SUM(hospital_patient_data_clean[Treatment_Cost])

// Revenue YoY %
Revenue YoY % = 
DIVIDE(
    [Total Revenue] - [Previous Year Revenue],
    [Previous Year Revenue],
    0
) * 100

// Discharge Success Rate
Discharge Success Rate % = 
DIVIDE(
    [Discharged Patients],
    [Total Admissions],
    0
) * 100

// Rolling 3 Month Avg Revenue
Rolling 3M Avg Revenue = 
CALCULATE(
    [Total Revenue],
    DATESINPERIOD(
        DateTable[Date],
        LASTDATE(DateTable[Date]),
        -3,
        MONTH
    )
) / 3
```

---

## 💡 Key Insights

### 📊 Financial Insights

1. **Total Revenue Generated:** $X,XXX,XXX over 2 years
2. **Average Treatment Cost:** $X,XXX per patient
3. **Highest Revenue Department:** Cardiology ($XXX,XXX)
4. **Insurance Coverage:** Average XX% coverage rate
5. **Out-of-Pocket Burden:** $XXX,XXX total patient payments

### 👥 Patient Insights

1. **Total Patients Served:** 1,200+ individuals
2. **Average Patient Age:** XX years
3. **Gender Distribution:** XX% Male, XX% Female
4. **Most Common Blood Type:** O+ (XX%)
5. **Average Hospital Stay:** X.X days

### 🏥 Operational Insights

1. **Busiest Department:** Emergency (XXX patients)
2. **Peak Admission Month:** [Month] with XXX admissions
3. **Emergency vs Elective:** XX% emergency admissions
4. **Discharge Success Rate:** XX% patients successfully discharged
5. **Follow-up Required:** XX% patients need follow-up care

### 📈 Performance Insights

1. **Most Efficient Department:** [Department] ($XXX revenue per day)
2. **Top Performing Doctor:** [Name] (XXX patients treated)
3. **Average Medications:** X.X per patient
4. **Average Lab Tests:** X.X per patient
5. **Year-over-Year Growth:** XX% revenue increase

### ⏰ Trend Insights

1. **Seasonal Patterns:** Higher admissions in [seasons]
2. **Revenue Trend:** Steady XX% monthly growth
3. **Length of Stay Trend:** Decreasing by XX%
4. **Cost Optimization:** XX% reduction in average cost
5. **Capacity Utilization:** XX% average bed occupancy

---

## 🎯 Business Recommendations

### 1. Revenue Optimization
- **Expand High-Revenue Services:** Invest in Cardiology and Neurology departments
- **Improve Insurance Negotiations:** Target 85%+ average coverage
- **Premium Services:** Introduce specialized treatment packages

### 2. Operational Efficiency
- **Reduce Length of Stay:** Implement protocols to reduce average stay by 1-2 days
- **Peak Period Staffing:** Increase staff during high-admission months
- **Emergency Department:** Optimize emergency workflow to reduce wait times

### 3. Cost Management
- **Bulk Purchasing:** Negotiate better rates for medications and supplies
- **Resource Sharing:** Share expensive equipment across departments
- **Preventive Care:** Reduce readmissions through better discharge planning

### 4. Patient Experience
- **Follow-up Programs:** Implement structured follow-up care (currently XX% require it)
- **Patient Education:** Reduce emergency admissions through preventive care education
- **Appointment Scheduling:** Optimize elective admission scheduling

### 5. Strategic Growth
- **Department Expansion:** Consider expanding top-performing departments
- **Technology Investment:** Implement EHR systems for better data tracking
- **Partnerships:** Explore insurance partnerships for better coverage rates
- **Market Analysis:** Target underserved patient demographics

---

## 📦 Project Deliverables

### Data Files
- ✅ `hospital_patient_data_messy.csv` - Raw data with quality issues
- ✅ `hospital_patient_data_clean.csv` - Reference clean data
- ✅ `hospital_patient_data_cleaned.csv` - Python cleaned output

### Code & Scripts
- ✅ `data_cleaning.py` - Complete Python cleaning script
- ✅ `analysis_queries.sql` - 20+ SQL analysis queries


### Visualizations
- ✅ `hospital_analytics_dashboard.pbix` - Interactive Power BI dashboard
- ✅ Dashboard screenshots 


 - Business insights and recommendations

---



## 🎓 Learning Outcomes

### Technical Skills Demonstrated

#### Excel
- ✅ Data exploration and profiling
- ✅ Initial quality assessment
- ✅ Pivot tables for quick analysis

#### Python (Pandas/NumPy)
- ✅ Data import and export (CSV, Excel)
- ✅ Data cleaning and transformation
- ✅ Handling missing values (fillna, interpolate)
- ✅ Date parsing and manipulation
- ✅ String operations (strip, replace, standardize)
- ✅ Creating calculated columns
- ✅ Data type conversions
- ✅ Statistical analysis (describe, groupby)
- ✅ Conditional logic (apply, lambda, map)

#### SQL
- ✅ Complex SELECT queries with multiple JOINs
- ✅ GROUP BY with multiple dimensions
- ✅ Aggregate functions (SUM, AVG, COUNT, MIN, MAX)
- ✅ Window functions (RANK, ROW_NUMBER, PERCENTILE)
- ✅ Subqueries and CTEs
- ✅ Date functions (YEAR, MONTH, DATEADD)
- ✅ CASE statements for conditional logic
- ✅ String manipulation functions
- ✅ HAVING clause for filtered aggregations
- ✅ Query optimization techniques

#### Power BI
- ✅ Data modeling and relationships
- ✅ DAX calculations (54+ measures)
- ✅ Time intelligence functions
- ✅ Calculated columns vs measures
- ✅ Filter context and row context
- ✅ CALCULATE and context modification
- ✅ Interactive visualizations
- ✅ Dashboard design principles
- ✅ Drill-through and drill-down
- ✅ Bookmarks and navigation
- ✅ Conditional formatting
- ✅ Custom tooltips
- ✅ Performance optimization

### Business Skills

- ✅ **Problem Identification** - Defining clear business problems
- ✅ **Data Storytelling** - Communicating insights effectively
- ✅ **Business Acumen** - Understanding healthcare operations
- ✅ **Stakeholder Communication** - Presenting to different audiences
- ✅ **Strategic Thinking** - Making data-driven recommendations
- ✅ **Project Management** - End-to-end project execution

---

## 🚀 Future Enhancements

### Phase 1: Advanced Analytics
- [ ] **Predictive Modeling**
  - Predict patient length of stay using regression
  - Forecast future admissions with time series analysis
  - Identify readmission risk factors

- [ ] **Patient Segmentation**
  - Cluster patients by treatment patterns
  - Identify high-value patient segments
  - Personalized care recommendations

### Phase 2: Real-Time Integration
- [ ] **Live Data Connection**
  - Connect to hospital management system API
  - Real-time dashboard updates
  - Automated daily refresh

- [ ] **Alerting System**
  - Email notifications for critical metrics
  - Threshold-based alerts
  - Anomaly detection

### Phase 3: Expanded Analysis
- [ ] **Geographic Analysis**
  - Patient location mapping
  - Service area analysis
  - Competitor benchmarking

- [ ] **Patient Journey Mapping**
  - Admission to discharge flow
  - Touchpoint analysis
  - Experience optimization

### Phase 4: Advanced Visualizations
- [ ] **Custom Visuals**
  - Sankey diagrams for patient flow
  - Network graphs for referral patterns
  - 3D visualizations for resource allocation

- [ ] **Mobile Dashboard**
  - Responsive design for tablets
  - Mobile app integration
  - On-the-go access



---


### 🌟 If you found this project helpful, please consider giving it a star! 🌟

**Made with ❤️ and ☕ by [Mohammad Sakib Miya]**

Dashboard screenshots
<img width="1271" height="724" alt="Screenshot 2025-12-17 191938" src="https://github.com/user-attachments/assets/cc79be51-6e07-40c9-994f-770841ba8919" />

<img width="1277" height="723" alt="Screenshot 2025-12-17 191947" src="https://github.com/user-attachments/assets/f9d378a3-45d0-4927-9a7c-f5e7b293a439" />


<img width="1267" height="716" alt="Screenshot 2025-12-17 191953" src="https://github.com/user-attachments/assets/7e68746e-65f4-4068-8868-f2d1ff0d6aba" />



<img width="1274" height="706" alt="Screenshot 2025-12-17 192003" src="https://github.com/user-attachments/assets/e2ec7710-daa8-4d25-a7f9-ccf156927738" />


<img width="1275" height="715" alt="Screenshot 2025-12-17 192011" src="https://github.com/user-attachments/assets/fa7661aa-8caa-4d86-afd8-d2aa7bd490c7" />

