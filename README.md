# DataAnalyst Exercises

To Run Pig Locally, Use:
sudo JAVA_HOME=$(/usr/libexec/java_home) $PIG_HOME/pig -x local register_udf.pig

User Defined Function: 
To avoid giving full package and class name, invoke the pig command 
-Dufd.import.list=org.apache.pig.piggybank.evaluation.string
