#descriptive

SPSS Python Extension function to use summary statistics in formulas

The benefit of this is that you don't have to have to issue an aggregate command first. You can just quickly use calculations like mean, median, sd on the fly.

This and other SPSS Python Extension functions can be found at http://www.stat-help.com/python.html

##Usage
**descriptive(variable, stat)**
* "variable" is a string indicating the variable for which you want to calculate the summary statistic. This argument is required.
* "stat" is a string indicating which summary statistic you want. This argument is required. Acceptable values are 
    * MEAN = Mean
    * STDDEV = Standard deviation
    * MINIMUM = Minimum value
    * MAXIMUM = Maximum value
    * SEMEAN = Standard error of the mean
    * VARIANCE = Variance
    * SKEWNESS = Skewness
    * SESKEW = Standard error of the skewness
    * RANGE = Range
    * MODE = Mode 
    * KURTOSIS = Kurtosis
    * SEKURT = Standard error of the kurtosis
    * MEDIAN = Median
    * SUM = Sum of all cases
    * VALID = Number of cases with non-missing values
    * MISSING = Number of cases with missing values

##Example
**xbar = descriptive("height", "mean")**
* xbar would take on the value of the mean height across all cases in the data set.
