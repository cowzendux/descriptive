* Encoding: UTF-8.
* Function to use summary statistics in an equation
* Benefit of this is that you don't have to have an aggregate first
* Can just quickly use calculations like mean, median, sd on the fly
* Written by Jamie DeCoster

***********************
* Version History
***********************
*
* 2010-06-21 created
* 2012-12-01 Does not try to return a value if all cases are missing
* 2013-04-04 Added the ability to get the number of valid cases and the
    number of missing cases
* 2013-04-08 Fixed a problem with program crashing with no valid values
* 2017-02-16 Cast return value as float or int
     Returns 0 for VALID if there are no valid cases in the dataset

set printback=off.
BEGIN PROGRAM PYTHON3.
import spss, spssaux, os

def descriptive(variable, stat):
# Valid values for stat are MEAN STDDEV MINIMUM MAXIMUM
# SEMEAN VARIANCE SKEWNESS SESKEW RANGE
# MODE KURTOSIS SEKURT MEDIAN SUM VALID MISSING
# VALID returns the number of cases with valid values, and MISSING returns
# the number of cases with missing values

     if (stat.upper() == "VALID"):
          cmd = "FREQUENCIES VARIABLES="+variable+"\n\
  /FORMAT=NOTABLE\n\
  /ORDER=ANALYSIS."
          freqError = 0
          handle,failcode=spssaux.CreateXMLOutput(
          	cmd,
          	omsid="Frequencies",
          	subtype="Statistics",
          	visible=False)
          result=spssaux.GetValuesFromXMLWorkspace(
          	handle,
          	tableSubtype="Statistics",
          	cellAttrib="text")
          if (len(result) > 0):
               return int(result[0])
          else:
               return(0)

     elif (stat.upper() == "MISSING"):
          cmd = "FREQUENCIES VARIABLES="+variable+"\n\
  /FORMAT=NOTABLE\n\
  /ORDER=ANALYSIS."
          handle,failcode=spssaux.CreateXMLOutput(
		cmd,
		omsid="Frequencies",
		subtype="Statistics",
		visible=False)
          result=spssaux.GetValuesFromXMLWorkspace(
		handle,
		tableSubtype="Statistics",
		cellAttrib="text")
          return int(result[1])
     else:
          cmd = "FREQUENCIES VARIABLES="+variable+"\n\
  /FORMAT=NOTABLE\n\
  /STATISTICS="+stat+"\n\
  /ORDER=ANALYSIS."
          handle,failcode=spssaux.CreateXMLOutput(
		cmd,
		omsid="Frequencies",
		subtype="Statistics",
     		visible=False)
          result=spssaux.GetValuesFromXMLWorkspace(
		handle,
		tableSubtype="Statistics",
		cellAttrib="text")
          if (float(result[0]) != 0 and len(result) > 2):
               return float((result[2]))

end program python.
set printback=on.
