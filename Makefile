OUTPUT = haskell-streamly.pdf
DEPS = $(wildcard img/*)

#------------------------------------------------------------------------------

LATEX = xelatex
LATEX_FLAGS = -interaction nonstopmode

#------------------------------------------------------------------------------

$(OUTPUT): $(DEPS)

CLEAN = *.log *.aux *.toc *.nav *.out *.snm

# Rules

clean:
	rm -f $(CLEAN)

distclean: clean
	rm -f $(OUTPUT)

# Run it twice
%.pdf: %.tex haskell-code.tex
	$(LATEX) $(LATEX_FLAGS) $*.tex && $(LATEX) $(LATEX_FLAGS) $*.tex
