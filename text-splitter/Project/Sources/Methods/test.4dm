//%attributes = {}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	//execute in a worker to process callbacks
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	var $logger : cs:C1710.text_splitter.logger
	$logger:=cs:C1710.text_splitter.logger.new()
	SHOW ON DISK:C922(File:C1566($logger.path).platformPath)
	
	var $file : 4D:C1709.File
	$file:=File:C1566("/DATA/sample.txt")
	
	var $text_splitter : cs:C1710.text_splitter.text_splitter
	$text_splitter:=cs:C1710.text_splitter.text_splitter.new()
	$results:=$text_splitter.chunk({file: $file; capacity: "100..200"; overlap: 10})
	
End if 