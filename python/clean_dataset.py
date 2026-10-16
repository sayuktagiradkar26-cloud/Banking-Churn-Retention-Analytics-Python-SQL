import pandas as pd

df = pd.read_csv("data/Churn_Modelling.csv")

print("Original Shape:", df.shape)

# Remove duplicate records
df = df.drop_duplicates()

# Remove unnecessary columns, if present
columns_to_drop = ["RowNumber", "Surname"]
df = df.drop(
    columns=[col for col in columns_to_drop if col in df.columns]
)

# Save cleaned dataset
df.to_csv("data/cleaned_bank_churn.csv", index=False)

print("Cleaned Shape:", df.shape)
print("Cleaned dataset saved successfully!")
