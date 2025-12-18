import pandas as pd
import numpy as np
from datetime import datetime
import warnings
warnings.filterwarnings('ignore')

# ========================
# STEP 1: LOAD MESSY DATA
# ========================
print("=" * 60)
print("HOSPITAL PATIENT DATA CLEANING PROCESS")
print("=" * 60)

df = pd.read_csv('hospital_patient_data_clean.csv')
print(f"\n📊 Initial Dataset Shape: {df.shape}")
print(f"Total Records: {df.shape[0]}")
print(f"Total Columns: {df.shape[1]}")

# ========================
# STEP 2: INITIAL DATA EXPLORATION
# ========================
print("\n" + "=" * 60)
print("INITIAL DATA QUALITY ASSESSMENT")
print("=" * 60)

# Check column names
print("\n1. Column Names (with spaces):")
print(df.columns.tolist())

# Check for missing values
print("\n2. Missing Values:")
missing_summary = pd.DataFrame({
    'Column': df.columns,
    'Missing_Count': df.isnull().sum(),
    'Missing_Percentage': (df.isnull().sum() / len(df) * 100).round(2)
})
print(missing_summary[missing_summary['Missing_Count'] > 0])

# Check data types
print("\n3. Data Types:")
print(df.dtypes)

# Check for duplicates
print(f"\n4. Duplicate Rows: {df.duplicated().sum()}")

# ========================
# STEP 3: CLEAN COLUMN NAMES
# ========================
print("\n" + "=" * 60)
print("STEP 1: CLEANING COLUMN NAMES")
print("=" * 60)

# Remove extra spaces and standardize
df.columns = df.columns.str.strip().str.replace(' ', '')
print("✅ Column names cleaned")
print("New columns:", df.columns.tolist())

# ========================
# STEP 4: HANDLE MISSING VALUES
# ========================
print("\n" + "=" * 60)
print("STEP 2: HANDLING MISSING VALUES")
print("=" * 60)

# Count missing before
missing_before = df.isnull().sum().sum()
print(f"Total missing values before: {missing_before}")

# Handle each column
# Patient_Name: Fill with 'Unknown Patient'
df['Patient_Name'] = df['Patient_Name'].fillna('Unknown Patient')
df['Patient_Name'] = df['Patient_Name'].str.strip()

# Age: Fill with median age
median_age = df['Age'].median()
df['Age'] = pd.to_numeric(df['Age'], errors='coerce')
df['Age'] = df['Age'].fillna(median_age)
df['Age'] = df['Age'].abs()  # Remove negative ages
df['Age'] = df['Age'].astype(int)

# Gender: Fill with mode
mode_gender = df['Gender'].mode()[0] if len(df['Gender'].mode()) > 0 else 'Male'
df['Gender'] = df['Gender'].str.strip().str.title()
df['Gender'] = df['Gender'].replace({'M': 'Male', 'F': 'Female', 'male': 'Male', 'female': 'Female'})
df['Gender'] = df['Gender'].fillna(mode_gender)

# Blood_Group: Fill with most common
mode_blood = df['Blood_Group'].mode()[0] if len(df['Blood_Group'].mode()) > 0 else 'O+'
df['Blood_Group'] = df['Blood_Group'].str.strip()
df['Blood_Group'] = df['Blood_Group'].fillna(mode_blood)

# Department & Doctor_Name: Fill with 'General Medicine' and 'Unknown Doctor'
df['Department'] = df['Department'].str.strip()
df['Department'] = df['Department'].fillna('General Medicine')
df['Doctor_Name'] = df['Doctor_Name'].fillna('Unknown Doctor')

# Diagnosis: Fill with 'General Checkup'
df['Diagnosis'] = df['Diagnosis'].fillna('General Checkup')

# Insurance_Type: Fill with 'Self-Pay'
df['Insurance_Type'] = df['Insurance_Type'].fillna('Self-Pay')

# Admission_Type & Discharge_Status: Fill with mode
df['Admission_Type'] = df['Admission_Type'].fillna('Routine Checkup')
df['Discharge_Status'] = df['Discharge_Status'].fillna('Discharged')

# Follow_Up_Required: Standardize and fill
df['Follow_Up_Required'] = df['Follow_Up_Required'].str.upper().str.strip()
df['Follow_Up_Required'] = df['Follow_Up_Required'].replace({
    'Y': 'Yes', 'N': 'No', 'TRUE': 'Yes', 'FALSE': 'No', '1': 'Yes', '0': 'No'
})
df['Follow_Up_Required'] = df['Follow_Up_Required'].fillna('No')

# Medication_Prescribed & Lab_Tests_Count: Fill with 0
df['Medication_Prescribed'] = df['Medication_Prescribed'].fillna(0).astype(int)
df['Lab_Tests_Count'] = df['Lab_Tests_Count'].fillna(0).astype(int)

# Count missing after
missing_after = df.isnull().sum().sum()
print(f"Total missing values after: {missing_after}")
print(f"✅ Removed/Filled {missing_before - missing_after} missing values")

# ========================
# STEP 5: CLEAN DATE COLUMNS
# ========================
print("\n" + "=" * 60)
print("STEP 3: CLEANING DATE COLUMNS")
print("=" * 60)

def parse_mixed_dates(date_series):
    """Parse dates in multiple formats"""
    parsed_dates = []
    for date_str in date_series:
        if pd.isna(date_str) or date_str == '':
            parsed_dates.append(pd.NaT)
        else:
            try:
                # Try multiple formats
                for fmt in ['%m/%d/%Y', '%Y-%m-%d', '%d/%m/%Y']:
                    try:
                        parsed_dates.append(pd.to_datetime(date_str, format=fmt))
                        break
                    except:
                        continue
                else:
                    # If all formats fail, use pandas parser
                    parsed_dates.append(pd.to_datetime(date_str, errors='coerce'))
            except:
                parsed_dates.append(pd.NaT)
    return pd.Series(parsed_dates)

# Parse dates
df['Admission_Date'] = parse_mixed_dates(df['Admission_Date'])
df['Discharge_Date'] = parse_mixed_dates(df['Discharge_Date'])

# Fill missing dates with median
median_admission = df['Admission_Date'].median()
median_discharge = df['Discharge_Date'].median()
df['Admission_Date'] = df['Admission_Date'].fillna(median_admission)
df['Discharge_Date'] = df['Discharge_Date'].fillna(median_discharge)

print("✅ Dates standardized to YYYY-MM-DD format")

# ========================
# STEP 6: CLEAN NUMERIC COLUMNS
# ========================
print("\n" + "=" * 60)
print("STEP 4: CLEANING NUMERIC COLUMNS")
print("=" * 60)

# Treatment_Cost: Remove $, commas, convert to float
df['Treatment_Cost'] = df['Treatment_Cost'].astype(str).str.replace('$', '').str.replace(',', '.')
df['Treatment_Cost'] = pd.to_numeric(df['Treatment_Cost'], errors='coerce')
df['Treatment_Cost'] = df['Treatment_Cost'].fillna(df['Treatment_Cost'].median()).round(2)

# Insurance_Coverage: Remove %, convert to numeric
df['Insurance_Coverage'] = df['Insurance_Coverage'].astype(str).str.replace('%', '').str.strip()
df['Insurance_Coverage'] = pd.to_numeric(df['Insurance_Coverage'], errors='coerce')
df['Insurance_Coverage'] = df['Insurance_Coverage'].fillna(0).round(2)

# Days_Stayed: Remove negatives
df['Days_Stayed'] = pd.to_numeric(df['Days_Stayed'], errors='coerce')
df['Days_Stayed'] = df['Days_Stayed'].abs()
df['Days_Stayed'] = df['Days_Stayed'].fillna(1).astype(int)

print("✅ Numeric columns cleaned and standardized")

# ========================
# STEP 7: REMOVE DUPLICATES
# ========================
print("\n" + "=" * 60)
print("STEP 5: REMOVING DUPLICATES")
print("=" * 60)

duplicates_before = df.duplicated().sum()
df = df.drop_duplicates()
duplicates_removed = duplicates_before - df.duplicated().sum()
print(f"✅ Removed {duplicates_removed} duplicate rows")

# ========================
# STEP 8: ADD CALCULATED COLUMNS
# ========================
print("\n" + "=" * 60)
print("STEP 6: CREATING CALCULATED COLUMNS")
print("=" * 60)

# Calculate out-of-pocket cost
df['Out_Of_Pocket_Cost'] = (df['Treatment_Cost'] * (100 - df['Insurance_Coverage']) / 100).round(2)

# Calculate insurance paid amount
df['Insurance_Paid'] = (df['Treatment_Cost'] * df['Insurance_Coverage'] / 100).round(2)

# Extract year and month
df['Admission_Year'] = df['Admission_Date'].dt.year
df['Admission_Month'] = df['Admission_Date'].dt.month
df['Admission_Month_Name'] = df['Admission_Date'].dt.strftime('%B')
df['Admission_Quarter'] = df['Admission_Date'].dt.quarter

# Calculate age groups
df['Age_Group'] = pd.cut(df['Age'], 
                         bins=[0, 18, 35, 50, 65, 100], 
                         labels=['0-18', '19-35', '36-50', '51-65', '65+'])

# Length of stay category
df['Stay_Category'] = pd.cut(df['Days_Stayed'], 
                              bins=[0, 3, 7, 14, 100], 
                              labels=['Short (1-3)', 'Medium (4-7)', 'Long (8-14)', 'Extended (15+)'])

print("✅ Added 10 new calculated columns")

# ========================
# STEP 9: STANDARDIZE TEXT COLUMNS
# ========================
print("\n" + "=" * 60)
print("STEP 7: STANDARDIZING TEXT COLUMNS")
print("=" * 60)

# Standardize text columns
text_columns = ['Patient_Name', 'Department', 'Doctor_Name', 'Diagnosis', 
                'Insurance_Type', 'Admission_Type', 'Discharge_Status']

for col in text_columns:
    df[col] = df[col].str.strip().str.title()

print("✅ Text columns standardized")

# ========================
# STEP 10: RENAME COLUMNS FOR CLARITY
# ========================
print("\n" + "=" * 60)
print("STEP 8: FINAL COLUMN RENAMING")
print("=" * 60)

df = df.rename(columns={
    'Insurance_Coverage': 'Insurance_Coverage_Percent'
})

print("✅ Columns renamed for clarity")

# ========================
# STEP 11: REORDER COLUMNS
# ========================
print("\n" + "=" * 60)
print("STEP 9: REORDERING COLUMNS")
print("=" * 60)

# Define column order
column_order = [
    'Patient_ID', 'Patient_Name', 'Age', 'Age_Group', 'Gender', 'Blood_Group',
    'Admission_Date', 'Admission_Year', 'Admission_Month', 'Admission_Month_Name', 
    'Admission_Quarter', 'Discharge_Date', 'Days_Stayed', 'Stay_Category',
    'Department', 'Doctor_Name', 'Diagnosis',
    'Admission_Type', 'Discharge_Status', 'Follow_Up_Required',
    'Treatment_Cost', 'Insurance_Type', 'Insurance_Coverage_Percent',
    'Insurance_Paid', 'Out_Of_Pocket_Cost',
    'Medication_Prescribed', 'Lab_Tests_Count'
]

df = df[column_order]
print("✅ Columns reordered logically")

# ========================
# STEP 12: FINAL DATA QUALITY CHECK
# ========================
print("\n" + "=" * 60)
print("FINAL DATA QUALITY REPORT")
print("=" * 60)

print(f"\n📊 Final Dataset Shape: {df.shape}")
print(f"Total Records: {df.shape[0]}")
print(f"Total Columns: {df.shape[1]}")

print("\n✅ Missing Values After Cleaning:")
final_missing = df.isnull().sum()
if final_missing.sum() == 0:
    print("No missing values! 🎉")
else:
    print(final_missing[final_missing > 0])

print("\n✅ Data Types:")
print(df.dtypes)

print("\n✅ Summary Statistics:")
print(df.describe())

# ========================
# STEP 13: SAVE CLEANED DATA
# ========================
print("\n" + "=" * 60)
print("SAVING CLEANED DATA")
print("=" * 60)

df.to_csv('hospital_patient_data_cleaned.csv', index=False)
df.to_excel('hospital_patient_data_cleaned.xlsx', index=False)

print("✅ Cleaned data saved successfully!")
print("   - hospital_patient_data_cleaned.csv")
print("   - hospital_patient_data_cleaned.xlsx")

# ========================
# STEP 14: DISPLAY SAMPLE DATA
# ========================
print("\n" + "=" * 60)
print("SAMPLE OF CLEANED DATA (First 5 rows)")
print("=" * 60)
print(df.head())

print("\n" + "=" * 60)
print("DATA CLEANING COMPLETE! ✅")
print("=" * 60)