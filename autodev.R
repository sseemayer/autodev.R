.re_match = function(pattern, query) {

	m = regexec(pattern, query)
	if(m[[1]][1] < 0) {return(NULL)}

	regmatches(query, m)[[1]][2]
}

.get_device = function(identifier) {
	.re_match("^[[:space:]]*([[:alpha:]]+)\\(", identifier)
}

.get_extension = function(identifier) {
	.re_match("\\.([a-zA-Z0-9]+)$", identifier)
}


.dev.names = c('pdf', 'postscript', 'xfig', 'bitmap', 'pictex', 'X11', 'cairo_pdf', 'cairo_ps', 'svg', 'png', 'jpeg', 'bmp', 'tiff', 'quartz')

.ext.devs = list()
.ext.devs[['pdf']] = pdf
.ext.devs[['ps']] = postscript
.ext.devs[['eps']] = postscript
.ext.devs[['svg']] = svg
.ext.devs[['png']] = png
.ext.devs[['jpg']] = jpeg
.ext.devs[['jpeg']] = jpeg
.ext.devs[['bmp']] = bmp
.ext.devs[['tiff']] = tiff

autodev = function(identifier, ...) {
	dev = .get_device(identifier)
	ext = .get_extension(identifier)

	if(!is.null(dev) && dev %in% .dev.names) {
		eval(parse(text=identifier));
	} else if(!is.null(ext) && ext %in% names(.ext.devs)) {
		dev = .ext.devs[[ext]]
		dev(identifier, ...)
	}
}

# expose autodev to commonr
if(exists("exports")) { exports = autodev }
