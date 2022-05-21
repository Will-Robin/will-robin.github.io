all: index.html

index.html: md_source/index.md
	pandoc -f markdown -t html md_source/index.md -s -o index.html -H ./styles/styles.css
