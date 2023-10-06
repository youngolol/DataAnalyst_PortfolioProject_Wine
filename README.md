# Data Cleaning Project: Wine Ratings
Source: https://www.kaggle.com/datasets/zynicide/wine-reviews/data

Updated Dataset: https://www.kaggle.com/datasets/manyregression/updated-wine-enthusiast-review

Visualization: https://public.tableau.com/app/profile/young.lee2672/viz/WineDashboard_16964503211660/Dashboard1

For this project, we took raw data with focused metrics in price, rating, location through SQL server and excel to improve usability for analysis.

## Step 1:
The original dataset was too large to upload to git, but blank cells and nulls were calculated. <1% of the data in 5/6 columns accounted for NULL/blanks, and <6% in the column indicated for price. Based on this, those entries were reasonably expunged based on relatively low contribution to the overall size. 

## Step 2: 
Files `tableau_sheet1_wine.xlsx` and `tableau_sheet1_wine.xlsx` are filters from the original dataset for visualization prep.

## Step 3: 
Initial attempt at cleaning the non-ASCII entries included example:
```
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'RosÃ©', 'Rose')
```
Whereby using an UPDATE--SET query, I made permanent changes to the dataset through My SQL Server. This was initially satisfactory, but there was quite a large growing number of non-ASCII characters to account for.

## Step 4:
The various versions of `tableau_sheet3_wine.xlsx` are iterations that go through the process of further cleaning the data due to quite a large number of non-ASCII characters in the data. To accomplish this, I utilized a user defined function with the following code: 
```
Function IsASC(str as string) as string
dim i As integer, x as integer
IsASC = "ok"
for i = 1 to len(str)
x = Asc(mid(str, i, 1))
if x < 31 Or x > 128 Then
IsASC = "Non-Asc detected"
end if
next i
end function
```

The loop ultimately returned whether or not a cell did or did not contain ASCII vs non-ASCII characters. Once identified, the entries were cross referenced through manual Google searches to edit the appropriate name using Find/Replace Excel functions to run through detecting "ok" vs "Non-Asc detected" entries. The lack of consistency in non-ASCII had to do with foreign named locations, wines, and/or wineries with various accented symbols.

## Step 5: 
Final relatively simple SQL queries run to find relative averages and organize the data for analysis and visualization.

