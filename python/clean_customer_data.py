import pandas as pd
import numpy as np

INPUT = "../data/customer_shopping_behavior_raw.csv"
OUTPUT = "../data/customer_shopping_behavior_clean.csv"

df = pd.read_csv(INPUT)
df.columns = [c.strip().lower().replace(" ","_").replace("(","").replace(")","").replace("-","_") for c in df.columns]
df = df.rename(columns={"purchase_amount_usd":"purchase_amount"})
df["review_rating"] = df["review_rating"].fillna(df["review_rating"].median())
df["age_group"] = pd.cut(df["age"], bins=[17,25,35,45,55,70],
                         labels=["18-25","26-35","36-45","46-55","56-70"], include_lowest=True)
df["customer_segment"] = np.select(
    [df["previous_purchases"].eq(1), df["previous_purchases"].between(2,10)],
    ["New","Returning"], default="Loyal"
)
df["discount_flag"] = np.where(df["discount_applied"].eq("Yes"),1,0)
df["promo_flag"] = np.where(df["promo_code_used"].eq("Yes"),1,0)
df.to_csv(OUTPUT, index=False)
print(f"Saved {len(df):,} cleaned rows to {OUTPUT}")
