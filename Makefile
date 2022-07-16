PANDOC_BASE=pandoc -f markdown -t html
TEMPLATE=--template=templates/template.html
CSS=--css=styles/styles.css

all: index.html northnet.html about.html chromefish.html chromprocess.html \
	flowcalc.html moonuscript.html taggregate.html publications.html

index.html: md_source/index.md styles/styles.css
	$(PANDOC_BASE) --section-divs md_source/index.md $(TEMPLATE) $(CSS) -s -o index.html

about.html: md_source/about.md styles/styles.css
	$(PANDOC_BASE) md_source/about.md $(TEMPLATE) $(CSS) -s -o about.html

northnet.html: md_source/northnet.md styles/styles.css
	$(PANDOC_BASE) md_source/northnet.md --highlight-style=zenburn $(TEMPLATE) $(CSS) -s -o northnet.html

chromefish.html: md_source/chromefish.md styles/styles.css
	$(PANDOC_BASE) md_source/chromefish.md $(TEMPLATE) $(CSS) -s -o chromefish.html

chromprocess.html: md_source/chromprocess.md styles/styles.css
	$(PANDOC_BASE) md_source/chromprocess.md $(TEMPLATE) $(CSS) -s -o chromprocess.html

flowcalc.html: md_source/flowcalc.md styles/styles.css
	$(PANDOC_BASE) md_source/flowcalc.md $(TEMPLATE) $(CSS) -s -o flowcalc.html

moonuscript.html: md_source/moonuscript.md styles/styles.css
	$(PANDOC_BASE) md_source/moonuscript.md $(TEMPLATE) $(CSS) -s -o moonuscript.html

taggregate.html: md_source/taggregate.md styles/styles.css
	$(PANDOC_BASE) md_source/taggregate.md $(TEMPLATE) $(CSS) -s -o taggregate.html

publications.html: md_source/publications.md styles/styles.css
	$(PANDOC_BASE) md_source/publications.md $(TEMPLATE) $(CSS) -o publications.html
