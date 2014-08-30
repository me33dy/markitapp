def fullTitle(page_title)
	base_title = "Markit"
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}"
	end
end