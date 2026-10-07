import pandas as pd                                      # pandas - Work with data
import matplotlib.pyplot as plt                          # matplotlib - Create charts
import seaborn as sns                                    # seaborn - Create statistical charts
import os                                                # os      - Create/access folders

# ==================================================
# STEP 1: Create folder for charts
# ==================================================

os.makedirs("charts", exist_ok=True)  


# ==================================================
# STEP 2: Load dataset
# ==================================================
df = pd.read_csv("sample_dataset.csv")  


# ==================================================
# STEP 3: Understand the dataset
# ==================================================
print("First 5 rows:")
print(df.head())

"""
Output:
First 5 rows:
          Category Region  Sales  Quantity  Discount  Profit
0        Furniture   East    500         5       0.1      80
1       Technology   West    700         3       0.0     150
2  Office Supplies  South    300         8       0.2      40

"""


print("\nShape of dataset:")
print(df.shape)

"""
Output:
Shape of dataset:
(3, 6)

"""

print("\nColumn names:")
print(df.columns)

"""
Output:
Column names:
Index(['Category', 'Region', 'Sales', 'Quantity', 'Discount', 'Profit'], dtype='object')

"""

print("\nDataset information:")
print(df.info())

"""
Output:
Dataset information:
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 3 entries, 0 to 2
Data columns (total 6 columns):
 #   Column      Non-Null Count  Dtype
---  ------      --------------  -----
 0   Category    3 non-null      object
 1   Region      3 non-null      object
 2   Sales       3 non-null      int64
 3   Quantity    3 non-null      int64
 4   Discount    3 non-null      float64
 5   Profit      3 non-null      int64

"""

print("\nStatistical summary:")
print(df.describe())

"""
Output:
            Sales  Quantity  Discount      Profit
count    3.000000  3.000000      3.00    3.000000
mean   500.000000  5.333333      0.10   90.000000
std    200.000000  2.516611      0.10   55.677644
min    300.000000  3.000000      0.00   40.000000
25%    400.000000  4.000000      0.05   60.000000
50%    500.000000  5.000000      0.10   80.000000
75%    600.000000  6.500000      0.15  115.000000
max    700.000000  8.000000      0.20  150.000000
"""

# ==================================================
# TASK 1: Line/bar chart showing Sales by Category
# ==================================================
sales_by_category = df.groupby("Category")["Sales"].sum()

plt.figure(figsize=(8, 5))

plt.bar(
    sales_by_category.index,
    sales_by_category.values
)

plt.title("Total Sales by Category")
plt.xlabel("Category")
plt.ylabel("Total Sales")

plt.tight_layout()

plt.savefig("charts/01_sales_by_category.png")

plt.show()

"""
Output:
Total Sales
700 |                    █
600 |                    █
500 | █                  █
400 | █                  █
300 | █        █         █
200 | █        █         █
100 | █        █         █
  0 +-------------------------
     Furniture Office   Technology
              Supplies
"""

# ==================================================
# TASK 2: Bar chart comparing Profit across Regions
# ==================================================
profit_by_region = df.groupby("Region")["Profit"].sum()

plt.figure(figsize=(8, 5))

plt.bar(
    profit_by_region.index,
    profit_by_region.values
)

plt.title("Total Profit by Region")
plt.xlabel("Region")
plt.ylabel("Total Profit")

plt.tight_layout()

plt.savefig("charts/02_profit_by_region.png")

plt.show()

"""
Output:
| Region | Total Profit |
|---|---:|
| East | 80 |
| South | 40 |
| West | 150 |
"""

# ==================================================
# TASK 3: Histogram showing the distribution of Sales
# ==================================================
plt.figure(figsize=(8, 5))

plt.hist(df["Sales"], bins=10)

plt.title("Distribution of Sales")
plt.xlabel("Sales")
plt.ylabel("Frequency")

plt.tight_layout()

plt.savefig("charts/03_sales_histogram.png")

plt.show()

"""
Output:
300
500
700
"""

# ==================================================
# TASK 4: Scatter plot showing Sales vs Profit
# ==================================================
plt.figure(figsize=(8, 5))

plt.scatter(
    df["Sales"],
    df["Profit"]
)

plt.title("Sales vs Profit")
plt.xlabel("Sales")
plt.ylabel("Profit")

plt.tight_layout()

plt.savefig("charts/04_sales_vs_profit.png")

plt.show()

"""
Output:
Sales   Profit
500       80
700      150
300       40
"""

# ======================================================
# TASK 5: Boxplot to detect outliers in Sales or Profit
# ======================================================
plt.figure(figsize=(8, 5))

sns.boxplot(x=df["Sales"])

plt.title("Boxplot of Sales")
plt.xlabel("Sales")

plt.tight_layout()

plt.savefig("charts/05_sales_boxplot.png")

plt.show()

"""
Output:
300, 500, 700
"""

# ==========================================================
# TASK 6: Seaborn correlation heatmap of the numeric columns
# ==========================================================

numeric_data = df[
    ["Sales", "Quantity", "Discount", "Profit"]
]

correlation = numeric_data.corr()

plt.figure(figsize=(8, 6))

sns.heatmap(
    correlation,
    annot=True,
    cmap="coolwarm",
    fmt=".2f"
)

plt.title("Correlation Heatmap")

plt.tight_layout()

plt.savefig("charts/06_correlation_heatmap.png")

plt.show()

"""
Output:
0.98
"""

# ==================================================
# TASK 7: Subplots
# ==================================================
category_data = df.groupby(
    "Category"
)[["Sales", "Profit"]].sum()

fig, axes = plt.subplots(
    1,
    2,
    figsize=(14, 5)
)

axes[0].bar(
    category_data.index,
    category_data["Sales"]
)

axes[0].set_title("Sales by Category")
axes[0].set_xlabel("Category")
axes[0].set_ylabel("Sales")

axes[1].bar(
    category_data.index,
    category_data["Profit"]
)

axes[1].set_title("Profit by Category")
axes[1].set_xlabel("Category")
axes[1].set_ylabel("Profit")

plt.tight_layout()

plt.savefig("charts/07_sales_profit_subplots.png")

plt.show()




