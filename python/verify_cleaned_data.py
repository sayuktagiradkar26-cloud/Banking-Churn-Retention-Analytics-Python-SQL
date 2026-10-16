import pandas as pd

df = pd.read_csv("data/cleaned_bank_churn.csv")

print("Cleaned dataset loaded successfully!")
print("Shape:", df.shape)

print("\nColumns:")
print(df.columns.tolist())

print("\nMissing values:")
print(df.isnull().sum())

print("\nDuplicate rows:", df.duplicated().sum())

print("\nFirst 5 records:")
print(df.head())
