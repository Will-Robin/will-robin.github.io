all: index.html northnet.html

index.html: md_source/index.md styles/styles.css
	pandoc -f markdown -t html md_source/index.md -s -o index.html -H ./styles/styles.css

northnet.html: md_source/northnet.md styles/styles.css
	pandoc -f markdown -t html md_source/northnet.md -s -o northnet.html -H ./styles/styles.css
