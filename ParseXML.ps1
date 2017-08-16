# parseXML.ps1
write-host "`nParsing file testCases.xml`n"
[System.Xml.XmlDocument] $xd = new-object System.Xml.XmlDocument
$file = resolve-path("testCases.xml")
$xd.load($file)
$nodelist = $xd.selectnodes("/testCases/testCase") # XPath is case sensitive
foreach ($testCaseNode in $nodelist) {
  $id = $testCaseNode.getAttribute("id")
  $inputsNode = $testCaseNode.selectSingleNode("inputs")
  $arg1 = $inputsNode.selectSingleNode("arg1").get_InnerXml()
  $optional = $inputsNode.selectSingleNode("arg1").getAttribute("optional")
  $arg2 = $inputsNode.selectSingleNode("arg2").get_InnerXml()
  $expected = $testCaseNode.selectSingleNode("expected").get_innerXml()
  #$expected = $testCaseNode.expected
  write-host "Case ID = $id Arg1 = $arg1 Optional = $optional Arg2 = $arg2 Expected value = $expected"
}
write-host "`nEnd parsing`n"