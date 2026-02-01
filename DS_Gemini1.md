Here is the **comprehensive 60-question MCQ Exam** for **WIA1007: Introduction to Data Science**, designed in **Hard Mode** based on your verified syllabus.

This set focuses on **application, calculation, and critical diagnosis** rather than simple definitions.

---

# **WIA1007 Final Exam: Hard Mode (MCQ Section)**

### **Topic 1: Data Science Lifecycle & Methodology**

1. **Scenario:** A Data Scientist has just finished cleaning a dataset (Phase 3). During the Exploration phase (Phase 4), they discover that 40% of the "Customer_ID" values are duplicates, which contradicts the assumption made during cleaning. What is the *immediate* next step in the lifecycle?
* A. Proceed to Feature Engineering to fix it.
* B. Drop the rows and move to Model Building.
* C. Revert to the Data Preparation phase to investigate and resolve the duplication issue.
* D. Ignore it as noise.


2. **Concept:** Which of the following best distinguishes a **Data Scientist** from a **Data Engineer**?
* A. A Data Scientist builds data pipelines; a Data Engineer builds models.
* B. A Data Scientist focuses on extracting insights and building predictive models; a Data Engineer focuses on architecture and database maintenance.
* C. A Data Scientist works only with SQL; a Data Engineer works only with Python.
* D. There is no difference; the terms are interchangeable.


3. **Methodology:** Why is the "Model Evaluation" phase critical *before* "Deployment"?
* A. To ensure the code runs without syntax errors.
* B. To verify the model performs well on unseen data and satisfies business metrics.
* C. To visualize the training data distribution.
* D. To train the model on the full dataset.



### **Topic 2: Data Types & Collection**

4. **Data Types:** You are analyzing a "Temperature" dataset measured in Celsius. You can calculate the difference (), but saying " is twice as hot as " is scientifically incorrect. What level of measurement is this?
* A. Nominal
* B. Ordinal
* C. Interval
* D. Ratio


5. **Data Types:** A dataset contains a column "Socioeconomic Status" with values: `{Low, Middle, High}`. Which encoding technique is **most appropriate** for a Linear Regression model, and why?
* A. One-Hot Encoding, to treat them as independent categories.
* B. Label/Ordinal Encoding (0, 1, 2), to preserve the inherent rank order.
* C. Frequency Encoding, to capture the popularity of each class.
* D. Drop the column as it is not numeric.


6. **Acquisition:** Which of the following data sources is classified as **Unstructured Data**?
* A. A SQL Database table.
* B. A CSV file with sales records.
* C. A folder of customer complaint emails (text).
* D. A JSON object with strict schema.



### **Topic 3: Data Cleaning & Preprocessing**

7. **Imputation Logic:** You have a feature `Annual_Income` with 5% missing values. The distribution is **highly right-skewed** (a few billionaires). Which imputation method minimizes bias?
* A. `SimpleImputer(strategy='mean')`
* B. `SimpleImputer(strategy='median')`
* C. `SimpleImputer(strategy='constant', fill_value=0)`
* D. Drop all rows with missing values.


8. **Binning:** You want to discretize "Age" into bins. Using **Equal-Width Binning** on a dataset with ages `[10, 11, 12, ..., 90, 1000]` (where 1000 is an outlier/error) will result in:
* A. Bins with approximately the same number of people.
* B. One bin containing almost all the data, and many empty bins leading up to 1000.
* C. The outlier being automatically removed.
* D. A normal distribution of data.


9. **Integration:** You have two DataFrames: `df_sales` (1000 rows) and `df_customers` (500 rows). You perform `df_sales.merge(df_customers, on='Cust_ID', how='left')`. What is the guaranteed number of rows in the result?
* A. 500
* B. 1000
* C. 1500
* D. 0


10. **Tidy Data:** A dataset shows "Test Scores" with columns: `[Student, Math_Score, Science_Score]`. To plot a boxplot comparing subjects using Seaborn, you need to transform it to:
* A. Wide Format
* B. Long Format (Columns: `Student`, `Subject`, `Score`)
* C. Matrix Format
* D. Normalized Format


11. **Code Logic:** What does `df.drop_duplicates(subset=['User_ID'], keep='last')` do?
* A. Removes all instances of duplicate User_IDs.
* B. Keeps the first occurrence of a User_ID and removes subsequent ones.
* C. Keeps the last occurrence of a User_ID and removes previous ones.
* D. Removes the 'User_ID' column.


12. **Scaling:** Why is **Min-Max Normalization** () sensitive to outliers?
* A. It ignores the mean.
* B. The outlier becomes the new 'Max', squashing all other data into a tiny range (e.g., 0.00 to 0.01).
* C. It results in negative values.
* D. It changes the distribution shape to Gaussian.


13. **Diagnosis:** After normalizing your data using Z-Score (`StandardScaler`), what will be the Mean and Standard Deviation of the transformed feature?
* A. Mean = 1, Std = 0
* B. Mean = 0, Std = 1
* C. Mean = Min, Std = Max
* D. Mean = 0.5, Std = 0.5


14. **Process:** What is **Data Leakage** in the context of preprocessing?
* A. When data is lost during file transfer.
* B. When information from the Test set (like the mean for imputation) is used to scale/impute the Training set.
* C. When the model memorizes the training data.
* D. When you have too many missing values.



### **Topic 4: Exploratory Data Analysis (EDA)**

15. **Interpretation:** You calculate the **Pearson Correlation** between `Study_Hours` and `Exam_Score` and get ****. What does this imply?
* A. Studying causes higher scores.
* B. There is a strong negative linear relationship.
* C. There is a strong positive linear relationship.
* D. The relationship is non-linear.


16. **Visualization:** You want to check if the variable `Salary` follows a **Normal Distribution**. Which plot is BEST?
* A. Scatter Plot
* B. Bar Chart
* C. Histogram
* D. Pie Chart


17. **Visualization:** Which plot is specifically designed to show the **Five-Number Summary** (Min, Q1, Median, Q3, Max) and detect outliers?
* A. Histogram
* B. Box Plot
* C. Violin Plot
* D. Line Plot


18. **Statistics:** In a **Negatively Skewed** (Left-Skewed) distribution, typically:
* A. Mean > Median
* B. Mean = Median
* C. Mean < Median
* D. Mode is the smallest value.


19. **Multivariate:** You want to visualize the relationship between `Horsepower` (X-axis), `MPG` (Y-axis), and `Origin` (Category: USA/Europe/Asia). How can you show all 3 dimensions on a 2D Scatter Plot?
* A. Use 3D glasses.
* B. Map `Origin` to the **color** or **shape** of the points.
* C. You cannot show 3 variables on a scatter plot.
* D. Use a Histogram.


20. **Outliers:** Using the IQR method, a data point is an outlier if it is:
* A. 
* B.  OR 
* C. Outside the range 
* D. 



### **Topic 5: Python (Pandas/Numpy/Matplotlib)**

21. **Numpy:** What is the result of `np.array([10, 20, 30]) > 15`?
* A. `[20, 30]`
* B. `[False, True, True]`
* C. `Error`
* D. `30`


22. **Pandas:** How do you select rows where `Age > 30` AND `Gender == 'F'`?
* A. `df['Age' > 30 and 'Gender' == 'F']`
* B. `df[(df['Age'] > 30) & (df['Gender'] == 'F')]`
* C. `df.query(Age > 30 and Gender == 'F')`
* D. `df.loc[Age > 30, Gender == 'F']`


23. **Pandas:** `df.iloc[:, -1]` selects:
* A. The last row.
* B. The last column.
* C. The cell at the last row, last column.
* D. Everything except the last column.


24. **Matplotlib:** To prevent a plot from being overwritten by a subsequent plot command in the same cell, you usually call:
* A. `plt.new()`
* B. `plt.figure()`
* C. `plt.clear()`
* D. `plt.hold()`


25. **Aggregations:** The code `df.groupby('Class')['Score'].mean()` performs which pattern?
* A. Filter-Map-Reduce
* B. Split-Apply-Combine
* C. Merge-Sort-Join
* D. Select-From-Where



### **Topic 6: Machine Learning Concepts**

26. **Learning Types:** Spam Filtering (Spam vs. Not Spam) is an example of:
* A. Regression
* B. Clustering
* C. Supervised Classification
* D. Reinforcement Learning


27. **Evaluation:** You split your data into Training (80%) and Testing (20%). If the model performs perfect on Training (100% Accuracy) but poorly on Testing (60% Accuracy), it is suffering from:
* A. Underfitting (High Bias)
* B. Overfitting (High Variance)
* C. Data Leakage
* D. Optimal Convergence


28. **Feature Engineering:** What is the dimensionality of a dataset with 10 rows and 5 categorical columns after applying One-Hot Encoding (assuming each column has 4 unique values)?
* A. 5 columns
* B. 20 columns
* C. 50 columns
* D. 4 columns


29. **Theory:** The "No Free Lunch" theorem implies:
* A. Deep Learning is always the best algorithm.
* B. No single algorithm is universally the best for all problems; you must experiment.
* C. You need more data to get better results.
* D. Computation costs money.



### **Topic 7: Linear Regression**

30. **Equation:** In the simple linear regression equation , what does  represent?
* A. The intercept (value when ).
* B. The slope (change in  for a 1-unit change in ).
* C. The error term.
* D. The learning rate.


31. **Metric:** Which metric squares the errors, thereby penalizing large errors more heavily?
* A. Mean Absolute Error (MAE)
* B. Mean Squared Error (MSE)
* C. R-Squared ()
* D. Root Mean Squared Error (RMSE)


32. **Gradient Descent:** If the **Learning Rate** () is set too high, what is the likely outcome?
* A. The model will converge very slowly.
* B. The model will overshoot the minimum and fail to converge (diverge).
* C. The model will get stuck in a local minimum.
* D. The model will overfit.


33. **Calculation:** If  and , what is the Squared Error?
* A. 2
* B. 4
* C. -2
* D. 64


34. **Interpretation:** An  score of 0.85 means:
* A. The model's accuracy is 85%.
* B. 85% of the variance in the target variable is explained by the features.
* C. The error is 15%.
* D. The correlation is 0.85.



### **Topic 8: Decision Trees & Ensembles**

35. **Algorithm:** Decision Trees split nodes to maximize **Information Gain**. This is equivalent to minimizing:
* A. Entropy / Impurity
* B. Accuracy
* C. Depth
* D. Number of Leaves


36. **Entropy Math:** A node contains 10 samples: 10 "Yes" and 0 "No". What is the Entropy?
* A. 1.0 (Maximum Impurity)
* B. 0.5
* C. 0.0 (Perfectly Pure)
* D. Infinity


37. **Hyperparameters:** Which parameter would you tune to **prevent** a Decision Tree from overfitting?
* A. Increase `max_depth`
* B. Set `min_samples_split` to 1
* C. Decrease `max_depth` (Pruning)
* D. Remove the target variable.


38. **Random Forest:** How does a Random Forest improve upon a single Decision Tree?
* A. By using a deeper tree.
* B. By using Bagging (Bootstrap Aggregation) to average predictions from many uncorrelated trees.
* C. By using Gradient Descent.
* D. By eliminating the need for data cleaning.


39. **Concept:** A "Leaf Node" in a Decision Tree represents:
* A. A test on an attribute.
* B. The final class prediction or value.
* C. The root of the data.
* D. A missing value.


40. **Ensemble:** Which ensemble method trains trees **sequentially**, where each new tree corrects the errors of the previous one?
* A. Bagging (Random Forest)
* B. Boosting (e.g., AdaBoost, XGBoost)
* C. Stacking
* D. Clustering



### **Topic 9: Neural Networks**

41. **Structure:** What is the fundamental building block of an Artificial Neural Network?
* A. The Perceptron (Neuron)
* B. The Decision Node
* C. The Cluster Centroid
* D. The Regression Line


42. **Math:** A neuron has inputs , weights , and bias . What is the **weighted sum** ()?
* A. 
* B. 
* C. 
* D. 


43. **Activation Function:** Which activation function outputs values in the range  and is often used for probability output?
* A. ReLU (Rectified Linear Unit)
* B. Sigmoid
* C. Step Function
* D. Linear


44. **Training:** The algorithm used to update weights by calculating the gradient of the loss function moving backward from output to input is:
* A. Feedforward
* B. K-Means
* C. Backpropagation
* D. Dimensionality Reduction


45. **Terminology:** What is an **Epoch**?
* A. One batch of data processed.
* B. One full pass of the entire training dataset through the network.
* C. The number of layers in the network.
* D. The final accuracy score.


46. **ReLU:** What is the output of ?
* A. -5
* B. 0
* C. 5
* D. 1



### **Topic 10: Advanced Application & Scenarios**

47. **Scenario:** You are predicting House Prices. Your dataset has a column `Pool_Area`. For houses without a pool, the value is `NaN`. What is the correct cleaning step?
* A. Impute with Mean Pool Area.
* B. Drop the rows.
* C. Fill `NaN` with 0 (Logic: No pool = 0 area).
* D. Use Forward Fill.


48. **Scenario:** Your model has **High Bias** and **Low Variance**. It is:
* A. Overfitting
* B. Underfitting
* C. Perfect
* D. Robust


49. **Coding:** `df.describe().T` is commonly used to:
* A. Transpose the summary statistics for better readability.
* B. Transform the data distribution.
* C. Test the data for normality.
* D. Train the model.


50. **Math:** The gradient of the function  at  is:
* A. 9
* B. 6 (Derivative is )
* C. 3
* D. 0


51. **Pandas:** Which function would you use to convert a string column "1,000" (with comma) into a number?
* A. `df.astype(int)`
* B. `pd.to_numeric(df['col'].str.replace(',', ''))`
* C. `df.values`
* D. `df.sort_values()`


52. **Visualization:** To compare the average salary across 3 different Job Titles, which plot is most suitable?
* A. Scatter Plot
* B. Bar Chart
* C. Line Chart
* D. Histogram


53. **Preprocessing:** When using `train_test_split`, why do we set `random_state=42`?
* A. It improves accuracy.
* B. It ensures the split is reproducible (same rows in train/test every time).
* C. It shuffles the data faster.
* D. It automatically normalizes the data.


54. **Neural Networks:** If you increase the number of Hidden Layers and Neurons significantly, the model is more likely to:
* A. Underfit
* B. Overfit (Memorize noise)
* C. Train faster
* D. Become Linear


55. **Logic:** A correlation of 0.02 between X and Y means:
* A. X and Y are unrelated.
* B. X causes Y.
* C. There is almost no **linear** relationship (though a non-linear one might exist).
* D. The data is incorrect.


56. **EDA:** Which command shows the number of non-null values and data types for every column?
* A. `df.head()`
* B. `df.columns`
* C. `df.info()`
* D. `df.shape`


57. **Data Reduction:** Principal Component Analysis (PCA) is used for:
* A. Increasing the number of features.
* B. Dimensionality Reduction (compressing info into fewer features).
* C. Supervised Classification.
* D. Imputation.


58. **Clustering:** Which of these is an **Unsupervised** algorithm?
* A. Linear Regression
* B. Decision Tree
* C. K-Means
* D. Logistic Regression


59. **Python:** What does the `%matplotlib inline` magic command do in Jupyter/Colab?
* A. Imports matplotlib.
* B. Allows plots to appear directly below the code cell.
* C. Saves plots to PDF.
* D. Animates the plots.


60. **Final Diagnosis:** You trained a model. Train Accuracy = 98%, Test Accuracy = 97%. This indicates:
* A. Serious Overfitting.
* B. Serious Underfitting.
* C. A well-generalized model.
* D. Data Leakage (likely, if the problem is hard, but "Well Generalized" is the standard interpretation of close high scores).



---

### **Answer Key**

1. **C** (Iterative lifecycle)
2. **B** (Role definitions)
3. **B** (Validation purpose)
4. **C** (Interval - no true zero)
5. **B** (Ordinal preserves rank)
6. **C** (Text is unstructured)
7. **B** (Median resists skew/outliers)
8. **B** (Outliers distort width)
9. **B** (Left join keeps all left rows)
10. **B** (Melt/Long for Seaborn hue)
11. **C** (Keep last logic)
12. **B** (Outlier squashing)
13. **B** (Std Normal def)
14. **B** (Leakage definition)
15. **C** (Strong positive linear)
16. **C** (Histogram shows distribution)
17. **B** (Boxplot 5-num summary)
18. **C** (Mean pulled left)
19. **B** (Visual encoding)
20. **B** (IQR Fence formula)
21. **B** (Boolean array)
22. **B** (Pandas boolean syntax)
23. **B** (Last column slice)
24. **B** (New figure context)
25. **B** (Split-Apply-Combine)
26. **C** (Supervised Classification)
27. **B** (Overfitting definition)
28. **B** (5 cols * 4 values = 20)
29. **B** (No universal algo)
30. **B** (Slope)
31. **B** (MSE squares errors)
32. **B** (Overshoot/Diverge)
33. **B** 
34. **B** (Variance explained)
35. **A** (Gain = Drop in Entropy)
36. **C** (Pure = 0 Entropy)
37. **C** (Pruning limits complexity)
38. **B** (Bagging/Ensemble)
39. **B** (Final output)
40. **B** (Boosting)
41. **A** (Perceptron)
42. **A** 
43. **B** (Sigmoid 0-1)
44. **C** (Backprop)
45. **B** (Epoch def)
46. **B** (ReLU clips negatives to 0)
47. **C** (Domain logic fill)
48. **B** (Underfitting)
49. **A** (Transpose)
50. **B** (Deriv of  is )
51. **B** (String cleanup)
52. **B** (Cat vs Num comparison)
53. **B** (Reproducibility)
54. **B** (Complexity risk)
55. **C** (Weak linear corr)
56. **C** (Info summary)
57. **B** (Reduction)
58. **C** (K-Means)
59. **B** (Inline plotting)
60. **C** (Good generalization)