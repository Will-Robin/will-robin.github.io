all: index.html

index.html: md_source/index.md styles/styles.css
	pandoc -f markdown -t html md_source/index.md -s -o index.html -H ./styles/styles.css
