	if did_filetype()	" filetype already set..
	  finish		" ..don't do these checks
	endif
	if getline(1) =~ '^#!.*\<osascript\>'
	  setfiletype applescript
	endif
