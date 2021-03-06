all: archives htmls

archives: archives/sem_010.zip archives/sem_020.zip archives/sem_030.zip archives/sem_040.zip archives/sem_050.zip archives/sem_060.zip archives/sem_070.zip archives/sem_080.zip archives/sem_090.zip
htmls: docs/seminar_010.html docs/hw_010.html docs/seminar_020.html docs/seminar_030.html docs/seminar_040.html

archives/sem_010.zip: docs/seminar_010.Rmd data/housing.wf1 data/housing.txt data/rus_utf8.csv data/rus_cp1251.csv data/cola.dta data/manipulate.sav data/cereal.csv docs/hw_010.Rmd
	zip -j archives/sem_010.zip docs/seminar_010.Rmd data/housing.wf1 data/housing.txt data/rus_utf8.csv data/rus_cp1251.csv data/cola.dta data/manipulate.sav data/cereal.csv docs/hw_010.Rmd
# option -j flattens folder structure!

archives/sem_020.zip: docs/seminar_020.Rmd data/adult.rds data/gdp.xls docs/hw_020.Rmd data/titanic.csv data/titanic_info.xlsx
	zip -j archives/sem_020.zip docs/seminar_020.Rmd data/adult.rds data/gdp.xls docs/hw_020.Rmd data/titanic.csv data/titanic_info.xlsx

archives/sem_030.zip: docs/seminar_030.Rmd data/Europenaprotein.csv data/gdp.xls docs/hw_030.Rmd
	zip -j archives/sem_030.zip docs/seminar_030.Rmd data/Europenaprotein.csv data/gdp.xls docs/hw_030.Rmd

archives/sem_040.zip: docs/seminar_040.Rmd data/Europenaprotein.csv docs/hw_040.Rmd
	zip -j archives/sem_040.zip docs/seminar_040.Rmd data/Europenaprotein.csv docs/hw_040.Rmd

archives/sem_050.zip: docs/seminar_050.Rmd data/pulse.txt docs/hw_050.Rmd
	zip -j archives/sem_050.zip docs/seminar_050.Rmd data/pulse.txt docs/hw_050.Rmd

archives/sem_060.zip: docs/seminar_060.Rmd docs/seminar_060_tex.Rmd data/pulse.txt
	zip -j archives/sem_060.zip docs/seminar_060.Rmd docs/seminar_060_tex.Rmd data/pulse.txt

archives/sem_070.zip: docs/seminar_070.Rmd data/xAPI-Edu-Data.csv
	zip -j archives/sem_070.zip docs/seminar_070.Rmd data/xAPI-Edu-Data.csv

archives/sem_080.zip: docs/seminar_080.Rmd data/Europenaprotein.csv data/xAPI-Edu-Data.csv
	zip -j archives/sem_080.zip docs/seminar_080.Rmd data/Europenaprotein.csv data/xAPI-Edu-Data.csv

archives/sem_090.zip: docs/seminar_090.Rmd data/russia.geojson data/xAPI-Edu-Data.csv
	zip -j archives/sem_090.zip docs/seminar_090.Rmd data/russia.geojson data/xAPI-Edu-Data.csv



docs/seminar_010.html: docs/seminar_010.Rmd
	cp data/*.* docs/
	Rscript -e "rmarkdown::render('docs/seminar_010.Rmd')"
	Rscript -e "rmarkdown::render('docs/seminar_010_solved.Rmd')"
	-rm docs/*.wf1
	-rm docs/*.xlsx
	-rm docs/*.txt
	-rm docs/*.csv
	-rm docs/*.sav
	-rm docs/*.dta
	-rm docs/*.rds


docs/seminar_020.html: docs/seminar_020.Rmd
	cp data/adult.rds docs/
	cp data/gdp.xls docs/
	Rscript -e "rmarkdown::render('docs/seminar_020.Rmd')"
	-rm docs/adult.rds
	-rm docs/gdp.xls

docs/seminar_030.html: docs/seminar_030.Rmd
	cp data/Europenaprotein.csv docs/
	cp data/gdp.xls docs/
	Rscript -e "rmarkdown::render('docs/seminar_030.Rmd')"
	-rm docs/Europenaprotein.csv
	-rm docs/gdp.xls

docs/seminar_040.html: docs/seminar_040.Rmd
	cp data/Europenaprotein.csv docs/
	Rscript -e "rmarkdown::render('docs/seminar_040.Rmd')"
	-rm docs/Europenaprotein.csv

docs/seminar_050.html: docs/seminar_050.Rmd
	cp data/pulse.txt docs/
	Rscript -e "rmarkdown::render('docs/seminar_050.Rmd')"
	-rm ddata/pulse.txt

docs/hw_010.html: docs/hw_010.Rmd
	cp data/cereal.csv docs/
	Rscript -e "rmarkdown::render('docs/hw_010.Rmd')"
	Rscript -e "rmarkdown::render('docs/hw_010_solutions.Rmd')"
	-rm docs/cereal.csv


# for future: it would be easier to copy whole data/ folder
clean:
	-rm docs/*.wf1
	-rm docs/*.xlsx
	-rm docs/*.xls
	-rm docs/*.txt
	-rm docs/*.csv
	-rm docs/*.sav
	-rm docs/*.dta
	-rm docs/*.rds
