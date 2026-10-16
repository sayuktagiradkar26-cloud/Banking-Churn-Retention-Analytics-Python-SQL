import pandas as pd

df = pd.read_csv("data/Churn_Modelling.csv")

print("Dataset Information:")
df.info()

print("\nStatistical Summary:")
print(df.describe())

print("\nDuplicate Rows:", df.duplicated().sum())

print("\nChurn Distribution:")
print(df["Exited"].value_counts())

print("\nChurn Percentage:")
print(df["Exited"].value_counts(normalize=True) * 100)
