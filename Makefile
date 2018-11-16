# source Rnw files
rnw = $(wildcard ls *.Rnw)

# get just the name (no extension)
#file = $(patsubst %.Rnw,%,$(rnw))

# figures
figure = $(wildcard ls figure/*.*)


.PHONY: clean


all: rfactors.tex


rfactors.tex: $(rnw) $(figure)
	Rscript -e "library(knitr); knit2pdf('rfactors.Rnw', output = 'rfactors.pdf')"
	# remove secondary files
	rm -f *.{aux,log,nav,out,snm,vrb,toc}


clean:
	rm -f *.tex
