import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

CHARTS_DIR = Path(__file__).resolve().parent / "charts"
CHARTS_DIR.mkdir(parents=True, exist_ok=True)

df = pd.read_csv("data/cleaned_bank_churn.csv")
print("Dataset Shape:", df.shape)
print("\nFirst 5 Rows:")
print(df.head())

print("\nColumn Names:")
print(df.columns.tolist())

print("\nChurn Distribution:")
print(df["Exited"].value_counts())

print("\nChurn Percentage:")
print(df["Exited"].value_counts(normalize=True) * 100)

churn_counts = df["Exited"].value_counts().sort_index()

plt.figure(figsize=(6, 4))
plt.bar(
    ["Retained (0)", "Churned (1)"],
    churn_counts.values
)

plt.title("Customer Churn Distribution")
plt.xlabel("Customer Status")
plt.ylabel("Number of Customers")
plt.tight_layout()
plt.savefig(CHARTS_DIR / "churn_distribution.png", dpi=300, bbox_inches="tight")
plt.show()

age_churn = df.groupby("Exited")["Age"].mean()

plt.figure(figsize=(6, 4))
plt.bar(
    ["Retained", "Churned"],
    [age_churn.loc[0], age_churn.loc[1]]
)

plt.title("Average Age: Retained vs Churned Customers")
plt.xlabel("Customer Status")
plt.ylabel("Average Age")
plt.tight_layout()
plt.savefig(CHARTS_DIR / "age_churn.png", dpi=300, bbox_inches="tight")
plt.show()

geo_churn = df.groupby("Geography")["Exited"].sum()

plt.figure(figsize=(7, 4))
plt.bar(geo_churn.index, geo_churn.values)

plt.title("Churned Customers by Geography")
plt.xlabel("Country")
plt.ylabel("Number of Churned Customers")
plt.tight_layout()
plt.savefig(CHARTS_DIR /"geography_churn_count.png", dpi=300, bbox_inches="tight")
plt.show()


geo_rate = df.groupby("Geography")["Exited"].mean() * 100

plt.figure(figsize=(7, 4))
plt.bar(geo_rate.index, geo_rate.values)

plt.title("Churn Rate by Geography")
plt.xlabel("Country")
plt.ylabel("Churn Rate (%)")
plt.tight_layout()
plt.savefig(CHARTS_DIR /"geography_churn_rate.png", dpi=300, bbox_inches="tight")
plt.show()

member_rate = df.groupby("IsActiveMember")["Exited"].mean() * 100

plt.figure(figsize=(6, 4))
plt.bar(
    ["Inactive", "Active"],
    [member_rate.loc[0], member_rate.loc[1]]
)

plt.title("Churn Rate: Active vs Inactive Members")
plt.xlabel("Membership Status")
plt.ylabel("Churn Rate (%)")
plt.tight_layout()
plt.savefig(CHARTS_DIR /"active_member_churn.png", dpi=300, bbox_inches="tight")
plt.show()

gender_rate = df.groupby("Gender")["Exited"].mean() * 100

plt.figure(figsize=(6, 4))
plt.bar(gender_rate.index, gender_rate.values)

plt.title("Churn Rate by Gender")
plt.xlabel("Gender")
plt.ylabel("Churn Rate (%)")
plt.tight_layout()
plt.savefig(CHARTS_DIR /"gender_churn.png", dpi=300, bbox_inches="tight")
plt.show()


product_rate = df.groupby("NumOfProducts")["Exited"].mean() * 100

plt.figure(figsize=(7, 4))
plt.bar(product_rate.index.astype(str), product_rate.values)

plt.title("Churn Rate by Number of Products")
plt.xlabel("Number of Products")
plt.ylabel("Churn Rate (%)")
plt.tight_layout()
plt.savefig(CHARTS_DIR /"product_churn.png", dpi=300, bbox_inches="tight")
plt.show()

print("\n--- PROJECT KEY FINDINGS ---")

print("Total Customers:", len(df))

print(
    "Overall Churn Rate:",
    round(df["Exited"].mean() * 100, 2), "%"
)

print(
    "Highest Churn Geography:",
    (df.groupby("Geography")["Exited"].mean() * 100).idxmax()
)

print(
    "Highest Churn Gender:",
    (df.groupby("Gender")["Exited"].mean() * 100).idxmax()
)

print(
    "Highest Churn Product Count:",
    (df.groupby("NumOfProducts")["Exited"].mean() * 100).idxmax()
)
