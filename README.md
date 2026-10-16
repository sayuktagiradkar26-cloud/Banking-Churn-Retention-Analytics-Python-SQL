# Banking Customer Churn & Retention Analytics

## Project Overview
This project analyzes banking customer data to understand customer churn patterns and identify customer groups that may need better retention strategies. SQL and Python are used for data quality checks, exploratory analysis, and visualization.

## Objectives
- Analyze overall customer churn and retention rates.
- Study churn by age group, geography, and gender.
- Explore customer behavior, including activity status, product usage, tenure, and account balance.
- Present findings that can support customer retention decisions.

## Tools & Technologies
- **SQL:** MySQL
- **Python:** Pandas, NumPy
- **Data Visualization:** Matplotlib, Seaborn
- **Development Environment:** MySQL Workbench, Visual Studio Code, Jupyter/Python

## Dataset
The dataset contains 10,000 customer records and 12 columns. The `Exited` column indicates whether a customer left the bank:
- `0` — Customer retained
- `1` — Customer churned

## Key Findings
- Total customers analyzed: 10,000
- Retained customers: 7,963 (79.63%)
- Churned customers: 2,037 (20.37%)
- Germany has a higher churn rate than France and Spain in this dataset.
- Customers aged 51 and above show a higher churn rate than younger age groups.
- Inactive customers show a higher churn rate than active customers.
- The four-product customer group has a very high churn rate, but the group is small and should be interpreted cautiously.

## Project Structure
- `data/` — Original and cleaned datasets
- `python/` — Data cleaning, exploration, and analysis scripts
- `python/charts/` — Generated visualizations
- `sql/` — SQL data quality checks and churn analysis queries

## Business Recommendations
- Investigate the reasons for higher churn in Germany.
- Consider engagement initiatives for inactive customers.
- Review the needs and feedback of older customers.
- Investigate product satisfaction and service issues before making product-related decisions.

## Conclusion
The analysis identifies customer segments with different churn rates. These findings can help guide further investigation and data-informed customer retention strategies.

**Note:** The results describe patterns in this dataset and do not establish the causes of customer churn.
re