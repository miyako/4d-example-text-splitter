//%attributes = {}
#DECLARE($item : Object)

$item.accumulator.push($item.value.paragraphs.extract("values").join(","))