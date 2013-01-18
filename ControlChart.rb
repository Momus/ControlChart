#require 'math' 

VERSION_STRING =  %{ControlChart V1.0.001alpha - 20091107}

module ControlChart


=begin rdoc


Author::  Dmitri G. Brengauz
Copyright::  Copyright (c) 2009 Momus Consulting LLC
License:: Same as Ruby (http://www.ruby-lang.org/en/LICENSE.txt)


= Introduction

Remarkable for its simplicity, versatility and power, Walter A. Shewhart's
statistical control chart revolutionized industrial production and helped
create the modern world.  Nearly ninety years since its introduction in the
1920's, it is still being used effectively to model processes unimagined
by its inventors.



This class models, as a Ruby object, both Shewhart's classic X-bar
chart, and the Exponentially Weighted Moving Average (EWMA)chart, which is 
derived from it.

The most contemporary comprehensive treatment of this subject is found in:

Montgomery <em>Introduction to Statistical Quality Control</em> Wiley: 2004

also a handy reference is:
<em>NIST/SEMATECH e-Handbook of Statistical Methods</em>
http://www.itl.nist.gov/div898/handbook/

but as the NIST handbook cites Montgomery solely, to him the ultimate credit
must go.


---


=end

  class ControlChart

    def initialize(mu="false" ,   \
		     sigma="false" , \
		     lambda_ewma="1" , \
		     run_length="0", \
		     data_interval="1")

=begin rdoc 
= Initial Conditions
  The constants defined below represent the initial conditions
  of the chart and should not change once the object is created. They
  should, however, remain visiable for inspection. 

=end rdoc  

# If this is a historically monitored process, its statistical mean
# (mu) may already be available.  In that case, it is preferable to use
# that instead of the calculated mean.    It is not a required 
# parameter, it is initialized "false" by default, and is not used
# unless a value is passed to it.  
      POPULATION_MEAN = mu

# The same with the standard deviation (sigma) for the process, 
# default is "false" :
      POPULATION_STD_DEV = sigma


# The major functional difference between X-bar and EWMA charts is the
# lambda, or the smoothing parameter. X-bar charts are useful for detecting
# large changes to the process mean, sigma > .5; EWMA charts are able to
# uncover small, consistent trends in the mean, by giving recent data more
# "weight" than older data.  EWMA charts also have  "the ability to time
#  market fluctuations while maintaining minimal capital allocation."
#  Whatever that means. 
# 
#  Chong, J. <em>J. of Economics and Business</em> 57:5, pp  463-490 
      LAMBDA_EWMA =  lambda_ewma



# "Run length" :  sometimes, especially when objects are used recursively.
# it may then be useful to "forget" past data points in the interests of
# saving resources. When this is set to zero, the run length is "infinite."
      RUN_LENGTH = run_length

# "Data Interval:" one of the reqirements of a control chart is that the
# data points come at fixed intervals, so this variable acts as a sort of
# auto-indexer for a data stream.
 
      DATA_INTERVAL = data_interval

# The data array should also be created.  It will have the following
# structure.

      chart_data =  Array.new

      
    end #initialize




end #ControlChart
end #module
