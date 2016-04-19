Steps for demo:

1.  Briefly show the demo.pig script, but do not
    show the Python code yet (just mention that
    it will take the input price in cents and
    return a value formatted in dollars).

2.  Run the script

      $ pig demo.pig

3.  The job will fail within one minute. 

4.  Observe that the console output does show
    us that the job failed, but does not explain
    why. Based on the error message, we could
    reasonably assume that it's a problem with 
    the Python script, but we don't know what
    the specific cause is nor exactly where in
    that script it failed. 

5.  Display the contents of the local log file
    mentioned in the error message on the console,
    which should be in the current local directory
    and named like pig_1363798244667.log. Note that
    this log shows more detail (a Java stacktrace), 
    but nothing particularly helpful to us.

6.  Open the JobTracker Web UI in your browser:

      http://localhost:50030/

7.  Scroll down to the list of failed jobs and then
    click the link for the Job ID corresponding to
    the job you just executed.

8.  Towards the right side of this page, click the
    hyperlink for the number in the "Failed/Killed
    Task Attempts" column (the number should be 4, 
    because by default the job will be killed when
    an individual task fails four times).

9.  Scroll to the far right of the resulting page, 
    and then click the "All" link in the "Logs"
    column. It doesn't matter which row (i.e. which 
    one of the tasks) we select here because they
    should have all failed for the same reason.

10. Observe that the syntax error is pointed out in
    the "stderr logs" section of the resulting page.

11. Before fixing the error in the Python script,
    demonstrate that because external scripts used
    by Pig via STREAM read from standard input and 
    write to standard output, it's easy to test our 
    fix locally without involving Pig or Hadoop at all. 
    We just redirect the input data to the script and 
    make sure we see the output we expected:

      $ python priceformat.py < demodata
   
    This will prove that we have a syntax error in 
    our Python code.

12. Edit the priceformat.py script to remove the 
    line with the syntax error and uncomment the
    line below that which fixes the error. The 
    problem was that Python received the values
    on standard input and treated them as strings, 
    but we needed to convert the price field to
    an int so we could do the numerical conversion
    to dollars and cents before formatting it.

13. After fixing the error in the Python code, run
    the script again and observe that the job no
    longer fails.

      $ pig demo.pig

    
14. Once the job completes successfully, show the
    result of our processing by using fs -cat to
    display the output created in HDFS:

     $ hadoop fs -cat demoreport/*
