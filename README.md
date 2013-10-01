# autodev - automatic graphics device creation for R

This is a small utility library for R command line applications to generate an appropriate graphics device from a string specification. The identifier passed to the `autodev` function can be:

   * a valid piece of R code creating a graphics device or
   * a filename.

`autodev` will detect which of the two argument types is passed and then either execute the R code or figure out the correct device creation command for writing to the given filename.

## Examples

### Creating a PNG file by filename

	autodev('test.png')
	plot(1:10)
	dev.off()

### Creating a PDF file by R code

	autodev('pdf("test.pdf", paper="a4r")')
	plot(1:10)
	dev.off()

## Installation

`autodev` can be used as a [commonr](https://github.com/sseemayer/commonr) module or by simply `source`ing the `autodev.R` file in your project.

## License

MIT
