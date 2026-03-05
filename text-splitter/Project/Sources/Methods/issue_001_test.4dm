//%attributes = {"invisible":true}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	//execute in a worker to process callbacks
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	var $logger : cs:C1710.text_splitter.logger
	$logger:=cs:C1710.text_splitter.logger.new()
	//SHOW ON DISK(File($logger.path).platformPath)
	
	var $file : 4D:C1709.File
	$file:=File:C1566("/RESOURCES/issue_001.json")
	
	var $text : Text
	$text:=$file.getText()
	
	var $json : Object
	$json:={pages: []}
	$json.pages.push($text)
	
	//$json.pages:=$json.pages.reduce(Formula($1.accumulator.push($1.value.paragraphs.extract("values").join(","; ck ignore null or empty))); [])
	
	var $text_splitter : cs:C1710.text_splitter.text_splitter
	$text_splitter:=cs:C1710.text_splitter.text_splitter.new()
	
	SET TEXT TO PASTEBOARD:C523(JSON Stringify:C1217($json; *))
	
	$results:=$text_splitter.chunk({file: $json; \
		capacity: "150..750"; \
		overlap: 75; \
		compact: True:C214; \
		batch: True:C214})
	
	SET TEXT TO PASTEBOARD:C523(JSON Stringify:C1217(JSON Parse:C1218($results[0]); *))
	
End if 