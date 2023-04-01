TEX_FILES := $(wildcard */*.tex)  # Find all .tex files in subdirectories
PDF_FILES := $(patsubst %.tex,%.pdf,$(TEX_FILES))  # Convert .tex to .pdf
CLEAN_UP := *.pdf */*.pdf *.log */*.log *.aux */*.aux *.fdb_latexmk */*.fdb_latexmk *.fls */*.fls *.out */*.out

.PHONY: all clean

all: $(PDF_FILES)
	@echo "All files compiled."

%.pdf: %.tex
	@echo "Compiling $< to $@"
	@cd $(dir $<) && lualatex $(notdir $<) && mv $(notdir $@) ../$(notdir $@)

clean:
	@rm -f $(CLEAN_UP)

