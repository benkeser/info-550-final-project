# Rule to build final report
final_report.html: render_final_report.R final_report.Rmd
	Rscript render_final_report.R

# Rule to build table
final_table.html: 00_read_data.R 01_make_summary_table.R
	Rscript 01_make_summary_table

# Rule to build figure
time_series_plot.png: 00_read_data.R 02_make_summary_table.R
	Rscript 02_make_summary_table
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html

.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"