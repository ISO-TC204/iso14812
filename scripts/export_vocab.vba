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


const path = "\\Mac\Home\Documents\GitHub\kvaughn\iso14812\scripts"
const rootPkg = "{252AE518-F70B-4f3a-A191-837351441A65}"
Dim objFSO, objDefFile
Dim iLevel
dim projectInterface as EA.Project
Dim count

Function HTMLEncode(ByVal sVal)
	'First replace links with GUIDs with links that can work with Word (start with alpha-char, no special chars, and no more than 40 chars)
	Dim objRegExp
	Set objRegExp = CreateObject("VBScript.RegExp")
	objRegExp.Global = True
	objRegExp.IgnoreCase = True
	objRegExp.Pattern = "<a href=""\$element:\/\/{(\w{8})-(\w{4})-(\w{4})-(\w{4})-(\w{12})}"">(.*?)<\/a>"
	sVal = objRegExp.Replace(sVal, "<i><a href=""#id$1$2$3$4$5"">$6</a></i> ( <span style='mso-element:field-begin'></span> REF id$1$2$3$4$5 <span style='mso-element:field-end'></span> )")
	objRegExp.Pattern = "\r\n"
	sVal = objRegExp.Replace(sVal, "\r\n<br />")
	
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
	Dim guid
	Dim sImg
	Dim w, h
	Dim wia
	Set wia = CreateObject("WIA.ImageFile")
	For Each dia In p.diagrams
		'Repository.WriteOutput "Script", Now & " Diagram: " & dia.Name, 0
		guid = getGUID(dia.DiagramGUID)
		writeLine("<figure>")
		iLevel = iLevel + 1
		writeLine("<guid>" & guid & "</guid>")
		writeLine("<name>" & dia.Name & "</name>")
		w = 100
		h = 100
		wia.LoadFile path & "\images\" & dia.Name & ".png"
		w = 0.67 * wia.Width
		h = 0.67 * wia.Height
		'Add to img tag if needed...   width=""" & w & """ height=""" & h & """ 
		sImg = "<img src=""images/" & dia.Name & ".png"" alt=""" & dia.Name & """ width=""" & w & """ height=""" & h & """ />"
		sImg = "<![CDATA[" & sImg & "]]>"
		writeLine("<img>" & sImg & "</img>")
		If dia.Notes <> "" Then
			writeLine("<text>" & dia.Notes & "</text>")
		End If 
		iLevel = iLevel - 1
		writeLine("</figure>")
	Next
	'Set wia = Nothing
	For Each el In p.elements
		id = getTaggedValue(el.TaggedValues, "id", el.Name)
		If el.Type="Class" and id <> "" Then 'and el.Stereotype <> "special"
			'Repository.WriteOutput "Script", Now & " " & el.Name, 0
			guid = getGUID(el.ElementGUID)
			writeLine("<term>")
			iLevel = iLevel + 1
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
			count = count + 1
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

sub DumpDiagrams ( thePackage )
    ' Iterate through all diagrams in the current package
    dim currentDiagram as EA.Diagram
    for each currentDiagram in thePackage.Diagrams

        ' Open the diagram
        Repository.OpenDiagram( currentDiagram.DiagramID )

        ' Save and close the diagram
        Session.Output( "Saving " & currentDiagram.Name )
        projectInterface.SaveDiagramImageToFile path + "\\images\\" + currentDiagram.Name + ".png"
        Repository.CloseDiagram( currentDiagram.DiagramID )
    next

    ' Process child packages
    dim childPackage as EA.Package
    for each childPackage in thePackage.Packages    
        DumpDiagrams childPackage
    next

end sub

Function LoadDiagramsRoot ()
    ' Iterate through all diagrams in Repository
    dim pkg as EA.Package
	dim root as EA.Package
	dim dia as EA.Diagram
	dim dict
	Set dict = CreateObject("scripting.dictionary") 

	Set root = Repository.GetPackageByGuid("{252AE518-F70B-4f3a-A191-837351441A65}")
	
    for each pkg in root.Packages
		Set dict = LoadDiagramsPkg (pkg, dict)
    next
	Set LoadDiagramsRoot = dict
end Function

Function LoadDiagramsPkg ( thePackage, theDict )
    ' Iterate through all diagrams in a package
    dim dia as EA.Diagram
    Dim element as EA.Element
	Dim obj as EA.DiagramObject
	Dim id, temp, name, ref, delobj

	for each dia in thePackage.Diagrams
		For Each obj in dia.DiagramObjects
			id = obj.ElementID
			Set element = Repository.GetElementByID(id)
			name = element.Name
			if name <> "" then
				temp = theDict(name)
				if Len(temp) > 0 then
					temp = temp & ", "
				end if
				ref = GetDiagramReference(dia)
				temp = temp & ref
				theDict(name) = temp
			end if
		Next
    next

    ' Process child packages
    dim childPackage as EA.Package
    for each childPackage in thePackage.Packages    
		Set theDict = LoadDiagramsPkg(childPackage, theDict)
    next
	Set LoadDiagramsPkg = theDict
end Function

Function GetDiagramReference (theDiagram)
	Dim pkg as EA.Package
	Dim id, ref, temp_ref, cont
	cont = 1
	
	id = theDiagram.PackageID
	Set pkg = Repository.GetPackageByID(id)
	While (cont > 0)
		temp_ref = getTaggedValue(pkg.Element.TaggedValues, "id", pkg.Name)
		if temp_ref = "" then
			cont = 0
		elseif Len(ref) > 0 Then
			ref = "." & ref
		End If
		ref = temp_ref & ref
		id = pkg.ParentID
		Set pkg = Repository.GetPackageByID(id) 
	Wend
	ref = "A" & Mid(ref, 2)
	GetDiagramReference = ref
End Function

 ' ======================================================================================
 ' Executes a SQL query and returns the result in a dictionary of rows
 '
 ' IN:
 '    sql  - the sql SELECT statement to run with optional arguments. Arguments must be
 '          denoted as {#} where # is the argument number, a specific value say {0} may occur
 '         multiple times
 '    args - a -string- of argument values, separated by the pipe symbol('|').
 '
 ' OUT:
 '    a dictionary object storing for each row in the result set a dictionary of columns
 '    (name/value pairs) where name is the name of a column in the SQL result in UPPERCASE
 '    - if an error occurs the call returns the value 'nothing'
 '
 ' NOTES:
 ' - All references to an argument {i} are replaced by its value
 ' - Always use dict.item(<columname>) to obtain column values: empty columns
 '   are -not- included in the XML returned by the call to Repository.SQLQuery so
 '   the number of columns may differ for each row in the dictionary.
 '   Use the vbscript isEmpty function to check for empty values.
 ' - the dictionary keys are -case sensitive-. To prevent obvious mistakes keys use
 '    -uppercase- column names
 '
 ' ======================================================================================
 Public Function ExecuteSQL(SQL, argList)
    set ExecuteSQL = Nothing

    Dim dict : set dict = CreateObject("Scripting.Dictionary")
    SQL = StrRep(SQL, argList)
    Session.output("INFO: executeSQL:  executing " + SQL)
    Dim xml : xml = SQLQuery(SQL)

    ' Parse the query result in a DOM tree
    Dim doc : set doc = CreateObject("MSXML2.DOMDocument")
    doc.validateOnParse = False
    doc.async = False
    doc.loadXML(xml)

    ' Populate the dictionary
    Dim rowNum : rowNum = 0
    Dim row, rowSet : Set rowSet = doc.selectNodes("//EADATA//Dataset_0//Data//Row")
    For Each row In rowSet
        Dim rowDict : set rowDict = CreateObject("Scripting.Dictionary")
        Dim col, colSet : set colSet = row.childNodes
        For Each col In colSet
            rowDict.add UCase(col.nodeName), col.Text
        Next
        dict.add rowNum, rowDict
        rowNum = rowNum + 1
    Next

    If (dict.count = 1) Then
        Session.output("INFO: executeSQL: found 1 record")
    Else
        Session.output("INFO: executeSQL: found " + CStr(dict.count) + " records")
    End If
    set ExecuteSQL = dict
 End Function

Function StrRep(str, argList)
    StrRep = ""

    Dim apl: apl = "{0}"
    If argList <> "" Then
        Dim args : args = Split(argList,"|")
        Dim i
        For i = 0 To UBound(args)
            apl = "{" + CStr(i) + "}"
            If InStr(str, apl) = 0 Then
                Session.output("ERROR: missing argument " + apl + " in '" + str + "'")
                Exit Function
            End If
            str = Replace(str, apl, args(i))
        Next
        apl = "{" + CStr(UBound(args) + 1) + "}"
    End If

    ' Check for unassigned parameters
    If InStr(str, apl) <> 0 Then
        Session.output("ERROR: Value for argument " + apl + " not supplied ('" + str + "')")
    Else
        StrRep = str
    End If
 End Function

Sub writeFigureIndex()
	Dim elems, element, row, dict, sql, msg, count
	count = 0
	Set elems = Repository.GetElementSet("", 0)
	Session.output("Start")
	'sql = "SELECT t_diagram.name FROM t_diagramobjects AS dobj INNER JOIN t_diagram  ON dobj.diagram_id = t_diagram.diagram_id WHERE  t_diagramobjects.Object_ID = {0}"
	'sql = "select t_diagramobjects.Diagram_ID from t_diagramobjects where t_diagramobjects.Object_ID = {0};"
	Set dict = LoadDiagramsRoot()
	msg = "<entry><name>{0}</name><diagrams>{1}</diagrams></entry>"
	count = 0
	Dim i, keys, items, msg_final
	keys = dict.Keys
	items = dict.Items
	writeline("<figindex>")
	iLevel = iLevel + 1
	for i=0 to dict.Count-1
		count = count + 1
		msg_final = Replace(msg,"{0}",keys(i))
		msg_final = Replace(msg_final,"{1}",items(i))
		writeline(msg_final)
	next
	iLevel = iLevel - 1
	writeline("</figindex>")
End Sub


Sub ExportVocabInXml()
	' Show and clear the script output window
	count = 0
	Repository.EnsureOutputVisible "Script"
	Repository.ClearOutput "Script"
	Repository.CreateOutputTab "Error"
	Repository.ClearOutput "Error"
		
	' Get the currently selected package in the tree to work on
	set projectInterface = Repository.GetProjectInterface()
	Dim thePackage as EA.Package
	Set thePackage = Repository.GetPackageByGuid(rootPkg)
		
	If not thePackage is nothing and thePackage.ParentID <> 0 then
		DumpDiagrams(thePackage)
		Set objFSO=CreateObject("Scripting.FileSystemObject")
		Set objDefFile = objFSO.CreateTextFile(path & "\" & thePackage.Name & ".xml",True)
		iLevel = 0
		writeHeader()
		Call writePackage(thePackage, "")
		writeFigureIndex()
		writeFooter()
		objDefFile.Close
		Repository.WriteOutput "Script", Now & " Total terms = " & count, 0
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