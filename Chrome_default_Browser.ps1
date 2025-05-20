# function definition
Import-DefaultAppAssocs {
    param(
	[ValidatePattern('\.xml$')]
	[ValidateScript({Resolve-Path $_})]
	[string]$XMLPath
    )

dism /online /Import-DefaultAppAssociations:"$XMLPath"
} # end function def
# call function
Import-DefaultAppAssocs -XMLPath "C:\Users\Henry\Desktop\test.xml"