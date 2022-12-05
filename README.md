# INFO 550 Final Project

**Rachel Sagers**

## Project Organization

### Data

Raw project data can be found in the data folder. This data includes the date and the mean daily PM2.5 concentration that day. 

### Code

The code to load the data, build the table, and make the figure can be found in the code directory with descriptive file names.

### Output

The figure and table generated for this project are saved in the output directory when the code to create them is executed.

### Renv project library managment

The lockfile called 'renv.lock' contains information about the R packages related to the project. There is a rule included in the Makefile that runs the renv::restore() command with all prompts automatically selected to synchronize the project library. Run this rule by executing 'make install'.

## Final Report

The final html report can be generated using the 'make' command, which will also automatically synchronize the project library. This report contains background information about the data, a table containing descriptive statistics, and a time series graph. 

## Docker Container

A docker image for creating this report is available on DockerHub at https://hub.docker.com/repository/docker/rachelsagers/finalproject. Use the 'docker pull rachelsagers/finalproject" to retrieve the docker image. To build the container locally, run 'docker build -t rachelsagers/finalproject.' To run the container interactively, execute docker run -it rachelsagers/finalproject bash.' To generate the report inside the container, use 'make final_report.html.'

To quickly and automatically create the report in the container, run "make report/final_report.html" and the final report will outputted in the report directory for retrieval. 