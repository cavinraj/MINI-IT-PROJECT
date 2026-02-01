This cheatsheet compiles the essential coding patterns, libraries, and functions used across your labs and tutorials, ranging from basic data handling to advanced neural network construction.

### **1. Foundations: NumPy and Pandas**
These libraries are used for loading data and performing basic numerical manipulations.

*   **NumPy (`np`):**
    *   `import numpy as np`.
    *   `np.array()`: Create a basic array.
    *   `np.random.seed(42)`: Ensure results are reproducible.
*   **Pandas (`pd`):**
    *   `import pandas as pd`.
    *   `df = pd.read_csv('path.csv')`: Load a dataset.
    *   `df.head()` / `df.tail()`: Preview the first or last 5 rows.
    *   `df.info()`: Check column data types and non-null counts.
    *   `df.describe()`: Get summary statistics (mean, std, min, max).
    *   `df['col'].nunique()`: Count unique values in a column.
    *   `df['col'].value_counts()`: Frequency of each category.

---

### **2. Data Acquisition and JSON**
Handling data from APIs and non-tabular formats.

*   **JSON Handling:**
    *   `json.dumps(data)`: Convert Python object to JSON string.
    *   `json.loads(json_data)`: Convert JSON string back to Python object.
*   **APIs and Web Scraping:**
    *   `import requests`: For RESTful API calls.
    *   `response = requests.get(url)`: Retrieve data from a web service.
    *   `from bs4 import BeautifulSoup`: For parsing HTML.
    *   `soup = BeautifulSoup(page.content, 'html.parser')`: Create a soup object.
    *   `soup.find_all('p')`: Find all specific tags.

---

### **3. Data Cleaning and Integration**
Preparing "dirty" data for analysis.

*   **Integration:**
    *   `df.merge(df2, on='key', how='left')`: Join two tables using a specific column (recommended over concat if row counts differ).
    *   `pd.concat([df1, df2], axis=1)`: Join tables side-by-side.
*   **Cleaning:**
    *   `df.isna().sum()`: Identify missing values per column.
    *   `df.dropna(subset=['target_col'])`: Remove rows where the target variable is missing.
    *   `df['col'].replace(',', '', regex=True)`: Clean string characters.
    *   `df['col'].astype(int)`: Convert a column to a specific data type.

---

### **4. Exploratory Data Analysis (EDA)**
Visualizing patterns and calculating statistical significance.

*   **Visualization:**
    *   `import matplotlib.pyplot as plt`.
    *   `import seaborn as sns`.
    *   `df['col'].hist()`: View numerical distribution.
    *   `sns.boxplot(x='cat', y='num', data=df)`: Identify outliers.
    *   `sns.regplot(x='x', y='y', data=df)`: Scatter plot with a regression line.
    *   `sns.heatmap(df.corr(), annot=True)`: Visualize correlation between features.
*   **Statistical Tests (`scipy.stats`):**
    *   `stats.pearsonr(x, y)`: Calculate correlation and p-value.
    *   `stats.ttest_ind(g1, g2, equal_var=False)`: Welch's t-test for two group means.
    *   `stats.f_oneway(*groups)`: One-way ANOVA for 3+ group means.

---

### **5. Machine Learning (Scikit-Learn)**
Building pipelines and predictive models.

*   **Preprocessing Tools:**
    *   `from sklearn.impute import SimpleImputer`: Fill missing values (`strategy='median'` or `'most_frequent'`).
    *   `from sklearn.preprocessing import StandardScaler`: Z-score normalization.
    *   `from sklearn.preprocessing import OneHotEncoder`: Categorical to numeric conversion.
*   **Model Workflow:**
    *   `X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)`.
    *   `ColumnTransformer(transformers=[...])`: Apply specific logic to specific columns.
    *   `Pipeline(steps=[...])`: Chain preprocessing and modeling together.
*   **Decision Trees:**
    *   `DecisionTreeRegressor(max_depth=3)`.
    *   `plot_tree(fitted_tree)`: Visualize tree logic.
    *   `GridSearchCV(model, param_grid, cv=3)`: Automated hyperparameter tuning.

---

### **6. Neural Networks (TensorFlow/Keras)**
Building Deep Learning models for regression.

*   **Architecture Construction:**
    *   `model = keras.Sequential()`.
    *   `model.add(layers.Input(shape=(input_dim,)))`.
    *   `model.add(layers.Dense(units=128, activation='relu'))`: Add hidden layer.
    *   `model.add(layers.Dropout(0.2))`: Prevent overfitting.
    *   `model.add(layers.Dense(1))`: Output layer for regression.
*   **Training & Tuning:**
    *   `model.compile(optimizer='adam', loss='mse', metrics=['mae'])`.
    *   `early_stop = keras.callbacks.EarlyStopping(patience=5)`.
    *   `history = model.fit(X_train, y_train, validation_split=0.2, epochs=50)`.
    *   `y_pred = model.predict(X_test)`.

---

### **7. Evaluation Metrics**
Standard measures for regression success.

*   `from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score`.
*   **MAE:** `mean_absolute_error(y_test, y_pred)`.
*   **RMSE:** `mean_squared_error(y_test, y_pred, squared=False)`.
*   **R²:** `r2_score(y_test, y_pred)`.