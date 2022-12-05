# Rule to build final report
final_report.html: code/render_final_report.R final_report.Rmd
	Rscript code/render_final_report.R

# Rule to build table
output/final_table.html: code/00_read_data.R code/01_make_summary_table.R
	Rscript code/01_make_summary_table.R

# Rule to build figure
output/time_series_plot.png: code/00_read_data.R code/02_make_summary_table.R
	Rscript code/02_make_summary_table.R
	
.PHONY: clean
clean:
	rm -f output/* && rm -f final_report.html

.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"
	
# Rule to build docker image
finalproject: Dockerfile final_report.Rmd code/00_read_data.R code/01_make_summary_table.R code/02_make_time_series.R code/render_final_report.R Makefile
	docker build -t finalproject .
	touch $@

# Rule to run docker container and build report automatically
report/final_report.html:
	docker run -v "/$$(pwd)/report":/project/report rachelsagers/finalproject
