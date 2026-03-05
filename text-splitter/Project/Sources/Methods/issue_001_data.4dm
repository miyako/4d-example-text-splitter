//%attributes = {"invisible":true}
$t:=""

For ($i; 1; 90)
	$t+="[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]"
End for 

var $file : 4D:C1709.File
$file:=File:C1566("/RESOURCES/issue_001.json")

$file.setText($t)