grDevices::X11.options(width = 8.5, height = 5, ypos = 0,
                       xpos = 1100, pointsize = 10)

options(error = function() {
  calls <- sys.calls()
  if (length(calls) >= 2L) {
    sink(stderr())
    on.exit(sink(NULL))
    cat("Backtrace:\n")
    calls <- rev(calls[-length(calls)])
    for (i in seq_along(calls)) {
      cat(i, ": ", deparse(calls[[i]], nlines = 1L), "\n", sep = "")
    }
  }
  if (!interactive()) {
    message("Exiting on error")
    q(status = 1)
  }
})

options(languageserver.formatting_style = function(opt) {
  # You can use opt$tabSize for indent_by
  styler::tidyverse_style(scope = "indention", indent_by = 2)
})

options(
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  warnPartialMatchArgs = TRUE
)

options(max.print = 100)
