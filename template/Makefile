build: main.tex
	/usr/bin/pdflatex $<

create_report:
	cp main.pdf ./MitM_ARP_Spoofing_Attack.pdf

clean:
	rm -rf *.aux *.log *.toc *.bbl *.blg *.out *.bcf *.xml *.xmpi 

cleanall: clean
	rm -rf *.pdf *.ps *.dvi

.PHONY: build, clean, cleanall
