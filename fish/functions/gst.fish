function gst
	if test (basename (pwd)) = "liferay-portal"
		git status -uno
	else
		git status
	end
end