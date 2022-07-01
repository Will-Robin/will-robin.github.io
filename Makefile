PANDOC_BASE=pandoc -f markdown -t html
TEMPLATE=--template=templates/template.html
CSS=--css=styles/styles.css

all: index.html northnet.html about.html

index.html: md_source/index.md styles/styles.css
	$(PANDOC_BASE) --section-divs md_source/index.md $(TEMPLATE) $(CSS) -s -o index.html

northnet.html: md_source/northnet.md styles/styles.css
	$(PANDOC_BASE) md_source/northnet.md $(TEMPLATE) $(CSS) -s -o northnet.html

about.html: md_source/about.md styles/styles.css
	$(PANDOC_BASE) md_source/about.md $(TEMPLATE) $(CSS) -s -o about.html
