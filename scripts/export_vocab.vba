option explicit

!INC Local Scripts.EAConstants-VBScript

' The EA tools to generate documentation are good from the perspective of 
' providing information to a reader, but they do not allow full control over
' presentation of specific fields. For example, the ISO format for documenting
' a term is to:
' 1. Assign a term number to the entry
' 2. List the term in bold
' 3. List other preferred alternative terms in bold, in order of preferrence
' 4. List other allowed terms 
' 5. List deprecated terms, marked as such
' 6. Provide the definition
' 7. Provide examples, notes, and source
'
' EA does not provide individual fields for all of this meta-data, but does 
' allow users to define their own fields using "tagged values". However, within
' the documentation, tagged values are all grouped together at the end, which 
' does not conform to the ISO format. In order to automate the production of 
' the text for the ISO document from the EA model, we needed to find an 
' alternate solution.
'
' This script is the first of four steps used to automatically generate the 
' ISO text. It exports the information from the EA model into an XML file that
' conforms to the iso_vocabulary.xsd format.  The second step is to perform an
' XSLT tranformation on the resultant XML file using the iso_vocabulary.xslt
' file to produce an HTML file containing all of the terms in the proper 
' format. The third step is to copy and paste the resultant text into an MS 
' Word document conforming to the ISO format. the final step is to insert
' any figures into the text into the desired locations.
'
' Script Name: Export Vocabulary in XML
' Author: Ken Vaughn
' Derived from: "Export definitions" by Knut Jetlund from ISO TC211
' Purpose: Exports each class as an ISO defined term in an XML format
' Date: 20181002
'
' Requirements:
' 1. A package must be selected in the Project Browser; the output will only 
'    show the contents of this package.
' 2. The most preferred term for the concept must be recorded as the name of 
'    the class
' 3. The definition of the term must be recorded in the "notes" field of the 
'    class. This field should boldface and italicize other defined terms 
'    used within the definition and follow the term with an indication of its
'    entry number.
' 4. Other preferred terms must be recorded as instances of the "Synonym" 
'    tagged value and must be listed in the order desired.
' 5. Other admitted terms must be recorded as instances of the "Admitted Term"
'    tagged value and must be listed in the order desired.
' 6. Deprecated terms must be recorded as instances of the "Deprecated Term"
'    tagged value and must be listed in the order desired.
' 7. Notes must be recorded as instances of the "Note" tagged value and must be 
'    listed in the order desired.
' 8. Examples must be recorded as instances of the "Example" tagged value and 
'    must be listed in the order desired.
' 9. The source information must be recorded in the "Source" tagged value.
'    There should only be one instance of the "Source" tagged value.
' 10.The desired ordering of terms within the package should be expressed by
'    using a sequntial number in the "Id" tagged value
' 11.Each desired index entry for the term shall be recorded in a "Index" 
'    tagged value.


const path = "\\Mac\Home\OneDrive"
Dim objFSO, objDefFile
Dim iLevel

Function HTMLEncode(ByVal sVal)
	'First replace links with GUIDs with links that can work with Word (start with alpha-char, no special chars, and no more than 40 chars)
	Dim objRegExp
	Set objRegExp = CreateObject("VBScript.RegExp")
	objRegExp.Global = True
	objRegExp.IgnoreCase = True
	objRegExp.Pattern = "<a href=""\$element:\/\/{(\w{8})-(\w{4})-(\w{4})-(\w{4})-(\w{12})}"">(.*?)<\/a>"
	sVal = objRegExp.Replace(sVal, "<a href=""#id$1$2$3$4$5"">$6</a> ( <span style='mso-element:field-begin'></span> REF id$1$2$3$4$5 <span style='mso-element:field-end'></span> )")
	
	' Enclose as CDATA
	sVal = "<![CDATA[" & sVal & "]]>"
    HTMLEncode = sVal
End Function

Sub writeLine(text)
	Dim i
	For i = 1 To iLevel
		objDefFile.Write vbTab
	Next
	objDefFile.Write text & vbCrLf
End Sub

Function getTaggedValue(tags, tagname, objname)
	Dim tag As EA.TaggedValue
	Dim bFound 
	bFound = False
	For Each tag In tags
		If tag.Name = "Vocab::" & tagname Then
			getTaggedValue = tag.Value
			bFound = True
			Exit For
		End If
	Next
	If Not bFound Then
		Repository.WriteOutput "Error", "Missing Tag (" & tagname & "): " & objname,0
		getTaggedValue = ""
	End If
End Function

Function writeTaggedValue(tags, tagname, objname)
	writeTaggedValue = getTaggedValue(tags, tagname, objname) 
	writeLine("<" & tagname & ">" & writeTaggedValue & "</" & tagname & ">")
End Function

Sub writeTaggedValues(tags, tagname)
	Dim tag As EA.TaggedValue
	For Each tag In tags
		If tag.Name = "Vocab::" & tagname Then
			If tag.Value = "" Then
				writeLine("<" & tagname & ">" & tag.Notes & "</" & tagname & ">")
			Else
				writeLine("<" & tagname & ">" & tag.Value & "</" & tagname & ">")
			End If
		End If
	Next
End Sub

Sub writeTaggedValuesAs(tags, tagname, xmlField)
	Dim tag As EA.TaggedValue
	For Each tag In tags
		If tag.Name = "Vocab::" & tagname Then
			writeLine("<" & xmlField & ">" & tag.Value & "</" & xmlField & ">")
		End If
	Next
End Sub

Function getGUID(ByVal guid)
	guid = Replace(guid, "{", "")
	guid = Replace(guid, "}", "")
	guid = Replace(guid, "-", "")
	guid = "id" & guid
	getGUID = guid
End Function

Sub writeHeader()
	writeLine("<?xml version=""1.0"" encoding=""UTF-8""?>")
	writeLine("<vocabulary xmlns=""https://www.iso.org/tc204/wg1/vocabulary""")
	iLevel = iLevel + 1
	writeLine("xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance""")
	writeLine("xsi:schemaLocation=""https://www.iso.org/tc204/wg1/vocabulary iso_vocabulary.xsd"">")
End Sub

'Recursive loop through subpackages and their elements and attributes, with controll of missing definitions
Sub writePackage(p, ByVal pkgId)
	Dim id
	Repository.WriteOutput "Script", Now & " Package: " & p.Name, 0
	writeLine("<package>")
	iLevel = iLevel + 1
	If pkgId <> "" Then
		pkgId = pkgId & "."
	End If
	id = getTaggedValue(p.Element.TaggedValues, "id", p.Name)
	pkgId = pkgId & CStr(id)
	writeLine("<id>" & id & "</id>")
	writeLine("<clause>" & pkgId & "</clause>")
	writeLine("<name>" & p.Name & "</name>")
	Dim el As EA.Element
	Dim bFound
	For Each el In p.elements
		If el.Type="Class" then 'and el.Stereotype <> "special"
			'Repository.WriteOutput "Script", Now & " " & el.Name, 0
			Dim guid
			guid = getGUID(el.ElementGUID)
			writeLine("<term>")
			iLevel = iLevel + 1
			id = getTaggedValue(el.TaggedValues, "id", el.Name)
			writeLine("<id>" & CStr(id) & "</id>")
			writeLine("<clause>" & pkgId & "." & CStr(id) & "</clause>")
			writeLine("<guid>" & guid & "</guid>")
			writeLine("<name>" & el.Name & "</name>")
			Call writeTaggedValues(el.TaggedValues, "synonym")
			Call writeTaggedValues(el.TaggedValues, "admittedTerm")
			Call writeTaggedValues(el.TaggedValues, "deprecatedTerm")
			writeLine("<definition>" & HTMLEncode(el.Notes) & "</definition>")
			Call writeTaggedValues(el.TaggedValues, "note")
			Call writeTaggedValues(el.TaggedValues, "example")
			Call writeTaggedValues(el.TaggedValues, "source")
			writeLine("<index>" & el.Name & "</index>")
			Call writeTaggedValuesAs(el.TaggedValues, "synonym", "index")
			Call writeTaggedValuesAs(el.TaggedValues, "admittedTerm", "index")
			Call writeTaggedValuesAs(el.TaggedValues, "deprecatedTerm", "index")
			Call writeTaggedValues(el.TaggedValues, "index")
			If el.Notes = "" Then
				Repository.WriteOutput "Error", "Missing definition: " & el.Name,0
			End If 
			iLevel = iLevel - 1
			writeLine("</term>")
		End If
	Next
	
	Dim subP as EA.Package
	For Each subP In p.packages
	    Call writePackage(subP, pkgId)
	Next
	iLevel = iLevel - 1
	writeLine("</package>")
End Sub

Sub writeFooter()
	iLevel = iLevel - 1
	writeLine("</vocabulary>")
End Sub


Sub ExportVocabInXml()
	' Show and clear the script output window
	Repository.EnsureOutputVisible "Script"
	Repository.ClearOutput "Script"
	Repository.CreateOutputTab "Error"
	Repository.ClearOutput "Error"
		
	' Get the currently selected package in the tree to work on
	Dim thePackage as EA.Package
	Set thePackage = Repository.GetTreeSelectedPackage()
		
	If not thePackage is nothing and thePackage.ParentID <> 0 then
		Set objFSO=CreateObject("Scripting.FileSystemObject")
		Set objDefFile = objFSO.CreateTextFile(path & "\" & thePackage.Name & ".xml",True)
		iLevel = 0
		writeHeader()
		Call writePackage(thePackage, "")
		writeFooter()
		objDefFile.Close
		Repository.WriteOutput "Script", Now & " Finished, check the Error and Types tabs", 0 
		Repository.EnsureOutputVisible "Script"
	Else
		' No package selected in the tree
		MsgBox( "This script requires a package to be selected " & _
			"in the Project Browser." & vbCrLf & _
			"Please select a package in the Project Browser and try again." )
	End If
End Sub

ExportVocabInXml