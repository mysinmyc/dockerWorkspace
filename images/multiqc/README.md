MULTIQC
==============


Docker image to build HTML report starting from bioinformatics analyses by using [MultiQC](http://multiqc.info/)


#How to run

To execute a report on the current directory 
```
docker run --rm --volume $PWD:/data mysinmyc/multiqc
```
