inputFile = LOAD 'hdfs:///user/nikitha/txtFile.txt' AS (line);

words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;


grpd = GROUP words BY word;

cntd = FOREACH grpd GENERATE group, COUNT(words);


rmf hdfs:///user/nikitha/results;

STORE cntd INTO 'hdfs:///user/nikitha/results';