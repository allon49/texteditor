/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.1
import QtQuick.Window 2.1
import org.qtproject.example 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0

//import "texteditor.js" as Activity




ApplicationWindow {

    id: appWin

    property string oldText

    signal start
    signal stop

    Component.onCompleted: {

        console.log("connecte start")

        start()  //.connect(start)


        //Activity.stop.connect(stop)
    }

    // Add here the QML items you need to access in javascript
    QtObject {
        id: items


        property alias textArea: textArea
    }

    onStart: {
        console.log("démarre l'appli")
        //Activity.start(items)
    }

    onStop: { Activity.stop() }



    visible: true
    width: 640
    height: 480
    minimumWidth: 400
    minimumHeight: 300

    title: document.documentTitle + " - Text Editor Example"




    MessageDialog {
        id: aboutBox
        title: "About Text"
        text: "This is a basic text editor \nwritten with Qt Quick Controls"
        icon: StandardIcon.Information
    }

    Action {
        id: cutAction
        text: "Cut"
        shortcut: "ctrl+x"
        iconSource: "images/editcut.png"
        iconName: "edit-cut"
        onTriggered: textArea.cut()
    }

    Action {
        id: copyAction
        text: "Copy"
        shortcut: "Ctrl+C"
        iconSource: "images/editcopy.png"
        iconName: "edit-copy"
        onTriggered: textArea.copy()
    }

    Action {
        id: pasteAction
        text: "Paste"
        shortcut: "ctrl+v"
        iconSource: "qrc:images/editpaste.png"
        iconName: "edit-paste"
        onTriggered: textArea.paste()
    }

    Action {
        id: alignLeftAction
        text: "&Left"
        iconSource: "images/textleft.png"
        iconName: "format-justify-left"
        shortcut: "ctrl+l"
        onTriggered: document.alignment = Qt.AlignLeft
        checkable: true
        checked: document.alignment == Qt.AlignLeft
    }
    Action {
        id: alignCenterAction
        text: "C&enter"
        iconSource: "images/textcenter.png"
        iconName: "format-justify-center"
        onTriggered: document.alignment = Qt.AlignHCenter
        checkable: true
        checked: document.alignment == Qt.AlignHCenter
    }
    Action {
        id: alignRightAction
        text: "&Right"
        iconSource: "images/textright.png"
        iconName: "format-justify-right"
        onTriggered: document.alignment = Qt.AlignRight
        checkable: true
        checked: document.alignment == Qt.AlignRight
    }
    Action {
        id: alignJustifyAction
        text: "&Justify"
        iconSource: "images/textjustify.png"
        iconName: "format-justify-fill"
        onTriggered: document.alignment = Qt.AlignJustify
        checkable: true
        checked: document.alignment == Qt.AlignJustify
    }

    Action {
        id: boldAction
        text: "&Bold"
        iconSource: "images/textbold.png"
        iconName: "format-text-bold"
        onTriggered: document.bold = !document.bold
        checkable: true
        checked: document.bold
    }

    Action {
        id: italicAction
        text: "&Italic"
        iconSource: "images/textitalic.png"
        iconName: "format-text-italic"
        onTriggered: document.italic = !document.italic
        checkable: true
        checked: document.italic
    }
    Action {
        id: underlineAction
        text: "&Underline"
        iconSource: "images/textunder.png"
        iconName: "format-text-underline"
        onTriggered: document.underline = !document.underline
        checkable: true
        checked: document.underline
    }


    Action {
        id: prepareAnswerFields
        text: "prepareAnswerFields"
        iconSource: "images/createmultianswerchoices.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.prepareAnswerFields()
        //    textAreaDestination.displayAnswerChoices()
        }
    }

    Action {
        id: insertSpaceForMultipleChoiceBoxes
        text: "insertSpaceForMultipleChoiceBoxes"
        iconSource: "images/ok.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.insertSpaceForMultipleChoiceBoxes()
        }
    }

    Action {
        id: deleteAnswerChoices
        text: "deleteAnswerChoices"
        iconSource: "images/ok.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.deleteAnswerChoices()
        }
    }

    Action {
        id: insertMultipleChoiceBoxes
        text: "insertMultipleChoiceBoxes"
        iconSource: "images/ok.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.insertMultipleChoiceBoxes()
        }
    }

    Action {
        id: deleteMultipleChoiceBoxes
        text: "deleteMultipleChoiceBoxes"
        iconSource: "images/ok.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.deleteMultipleChoiceBoxes()
        }
    }

    Action {
        id: insertSuccessAndFailMark
        text: "insertSuccessAndFailMark"
        iconSource: "images/ok.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.insertSuccessAndFailMark(true, 2)
        }
    }

    Action {
        id: checkAnswers
        text: "checkAnswers"
        iconSource: "images/ok.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.checkAnswers()
        }
    }

    Action {
        id: deleteSuccessAndFailMark
        text: "deleteSuccessAndFailMark"
        iconSource: "images/ok.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.deleteSuccessAndFailMark()
        }
    }

    Action {
        id: startExercice
        text: "startExercice"
        iconSource: "images/arrow-right.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.startExercice()
        }
    }




    FileDialog {
        id: fileDialog
        nameFilters: ["Text files (*.txt)", "HTML files (*.html, *.htm)"]
        onAccepted: {
            if (fileDialog.selectExisting)
                document.fileUrl = fileUrl
            else
                document.saveAs(fileUrl, selectedNameFilter)
        }
    }

    ColorDialog {
        id: colorDialog
        color: "black"
    }

    Action {
        id: fileOpenAction
        iconSource: "images/fileopen.png"
        iconName: "document-open"
        text: "Open"
        onTriggered: {
            fileDialog.selectExisting = true
            fileDialog.open()
        }
    }

    Action {
        id: fileSaveAsAction
        iconSource: "images/filesave.png"
        iconName: "document-save"
        text: "Save As…"
        onTriggered: {
            fileDialog.selectExisting = false
            fileDialog.open()
        }
    }



    menuBar: MenuBar {
        Menu {
            title: "&File"
            MenuItem { action: fileOpenAction }
            MenuItem { action: fileSaveAsAction }
            MenuItem { text: "Quit"; onTriggered: Qt.quit() }
            MenuItem { action: createWikiAnswerChoices }



        }
        Menu {
            title: "&Edit"
            MenuItem { action: copyAction }
            MenuItem { action: cutAction }
            MenuItem { action: pasteAction }
        }
        Menu {
            title: "F&ormat"
            MenuItem { action: boldAction }
            MenuItem { action: italicAction }
            MenuItem { action: underlineAction }
            MenuSeparator {}
            MenuItem { action: alignLeftAction }
            MenuItem { action: alignCenterAction }
            MenuItem { action: alignRightAction }
            MenuItem { action: alignJustifyAction }
            MenuSeparator {}
            MenuItem {
                text: "&Color ..."
                onTriggered: {
                    colorDialog.color = document.textColor
                    colorDialog.open()
                }
            }
        }
        Menu {
            title: "&Help"
            MenuItem { text: "About..." ; onTriggered: aboutBox.open() }
        }
    }

    toolBar: ToolBar {
        id: mainToolBar
        width: parent.width
        RowLayout {
            anchors.fill: parent
            spacing: 0
            ToolButton { action: fileOpenAction }

            ToolBarSeparator {}

            ToolButton { action: copyAction }
            ToolButton { action: cutAction }
            ToolButton { action: pasteAction }

            ToolBarSeparator {}

            ToolButton { action: boldAction }
            ToolButton { action: italicAction }
            ToolButton { action: underlineAction }

            ToolBarSeparator {}

            ToolButton { action: alignLeftAction }
            ToolButton { action: alignCenterAction }
            ToolButton { action: alignRightAction }
            ToolButton { action: alignJustifyAction }

            ToolBarSeparator {}

            ToolButton { action: alignJustifyAction }

            ToolButton {
                id: colorButton
                property var color : document.textColor
                Rectangle {
                    id: colorRect
                    anchors.fill: parent
                    anchors.margins: 8
                    color: Qt.darker(document.textColor, colorButton.pressed ? 1.4 : 1)
                    border.width: 1
                    border.color: Qt.darker(colorRect.color, 2)
                }
                onClicked: {
                    colorDialog.color = document.textColor
                    colorDialog.open()
                }
            }
            ToolBarSeparator {}

            ToolButton { action: prepareAnswerFields }

            ToolButton { action: insertSpaceForMultipleChoiceBoxes }

            ToolButton { action: deleteAnswerChoices }

            ToolButton { action: insertMultipleChoiceBoxes }

            ToolButton { action: deleteMultipleChoiceBoxes }

            ToolButton { action: insertSuccessAndFailMark }

            ToolButton { action: checkAnswers }

            ToolButton { action: deleteSuccessAndFailMark }

            ToolBarSeparator {}

            ToolButton { action: startExercice }

            ToolButton { action: checkAnswers }

            Item { Layout.fillWidth: true }
        }
    }

    ToolBar {
        id: secondaryToolBar
        width: parent.width

        RowLayout {
            id: secondaryToolBarRowLayout
            anchors.fill: parent
            ComboBox {
                id: fontFamilyComboBox
                implicitWidth: 150
                model: Qt.fontFamilies()
                property bool special : false
                onActivated: {
                    if (special == false || index != 0) {
                        document.fontFamily = textAt(index)
                    }
                }
            }
            SpinBox {
                id: fontSizeSpinBox
                activeFocusOnPress: false
                implicitWidth: 50
                value: 0
                property bool valueGuard: true
                onValueChanged: if (valueGuard) document.fontSize = value
            }
            Item { Layout.fillWidth: true }
            Text {
                id: scoreScreen
                font.family: "Helvetica"
                font.pointSize: 24
                color: "red"
            }
        }
    }



    TextArea {
        Accessible.name: "document"
        id: textArea

        property variant multiAnswersStrArray: []
        property variant multiAnswersStrArrayIndex: 0

        frameVisible: true
        width: parent.width
        height: parent.height/2
        anchors.top: secondaryToolBar.bottom
        //anchors.bottom: parent.bottom
        baseUrl: "qrc:/"
        text: document.text
        textFormat: Qt.RichText
        Component.onCompleted: forceActiveFocus()

        onCursorPositionChanged: {
            errorMessage.text = cursorPosition
        }

        onTextChanged: {
            textAreaDestination.prepareAnswerFields()
        }

    }

    TextArea {
        Accessible.name: "destDocument"
        id: textAreaDestination

        property var multipleChoicesElementsArray : []
        property var displayAnswerMarks : Boolean
        property var answersPlacesInserted: Boolean
        property var resultMarkStrInserted: Boolean
        property var answerFieldsPrepared: Boolean



        Component.onCompleted: {
            displayAnswerMarks = false
            answersPlacesInserted = false
            resultMarkStrInserted = false
            answerFieldsPrepared = false
        }


        function longestStrInArray(arr) {
            var lgth = 0;
            var longest = "";

            for(var i=0; i < arr.length; i++){
                if(arr[i].length > lgth){
                    var lgth = arr[i].length;
                    longest = arr[i];
                }
            }
            return longest
        }

        function shuffle(array) {
            var currentIndex = array.length, temporaryValue, randomIndex;

            // While there remain elements to shuffle...
            while (0 !== currentIndex) {

                // Pick a remaining element...
                randomIndex = Math.floor(Math.random() * currentIndex);
                currentIndex -= 1;

                // And swap it with the current element.
                temporaryValue = array[currentIndex];
                array[currentIndex] = array[randomIndex];
                array[randomIndex] = temporaryValue;
            }

            return array;
        }



        function startExercice() {
            resultMarkStrInserted = false
            textAreaDestination.prepareAnswerFields()
            textAreaDestination.insertSpaceForMultipleChoiceBoxes()
            textAreaDestination.insertMultipleChoiceBoxes()



        }

        function prepareAnswerFields() {

            answersPlacesInserted = false

            textAreaDestination.text = textArea.text

            var openingBracketPos = 0
            var closingBracketPos = 0
            var bracketOpened = false

            var openingBracketPosInDestTextArea = 0
            var closingBracketPosInDestTextArea = 0

            var nbOfCharactersRemoved = 0

            var indexTest = 0

            multipleChoicesElementsArray = []

            for (var i = 0; i < textArea.length; i++) {
                var oneTextChar = textArea.getText(i,i+1)

                if (oneTextChar == "[" && bracketOpened == true) {
                    errorMessage.text = "Two opening brackets ([) can not follow each other"
                }

                if (oneTextChar == "[") {
                    openingBracketPos = i
                    openingBracketPosInDestTextArea = openingBracketPos - nbOfCharactersRemoved
                    bracketOpened = true
                }

                //using closing bracket, detects a question and extract its information
                if (bracketOpened == true && oneTextChar == "]") {
                    closingBracketPos = i
                    closingBracketPosInDestTextArea = closingBracketPos - nbOfCharactersRemoved

                    bracketOpened = false

                    //extract the question, good and bad answers from multiple choices infos
                    var multipleChoiceElementStr = textArea.getText(openingBracketPos+1,closingBracketPos)
                    var questionStr
                    var goodAnswersArray = []
                    var badAnswersArray = []
                    var multipleChoiceElementStrArray = multipleChoiceElementStr.split("|")
                    for (var j = 0; j < multipleChoiceElementStrArray.length; j++) {
                        if (j == 0) {
                            questionStr = multipleChoiceElementStrArray[0]
                        }
                        else
                        {
                            if (multipleChoiceElementStrArray[j][multipleChoiceElementStrArray[j].length-1] == "*") {
                                multipleChoiceElementStrArray[j] = multipleChoiceElementStrArray[j].substr(0,multipleChoiceElementStrArray[j].length-1)
                                goodAnswersArray.push(multipleChoiceElementStrArray[j])                                
                            }
                            else {
                                badAnswersArray.push(multipleChoiceElementStrArray[j])
                            }
                        }
                    }

                    //store the for each question, its position, its good and bad answers
                    var multipleChoiceElement = {posInText:0, posInDestText:0, posInDestTextX:0, posInDestTextY:0, comboboxWidth:0, comboBoxValue:"", comboBoxIndex:0, answerFontFamily:"", answerFontSize:0, question:"", questionLength:0, shuffledPossibleAnswers:[], goodAnswers:[], badAnswers:[], longestChoiceStr:[], userAnswer:""}


                    multipleChoiceElement.posInText = openingBracketPosInDestTextArea
                    multipleChoiceElement.question = questionStr
                    var questionLength = questionStr.length
                    multipleChoiceElement.questionLength = questionLength
                    multipleChoiceElement.goodAnswers = goodAnswersArray
                    multipleChoiceElement.badAnswers = badAnswersArray
                    multipleChoiceElement.shuffledPossibleAnswers = shuffle(goodAnswersArray.concat(badAnswersArray))
                    multipleChoiceElement.longestChoiceStr = longestStrInArray(multipleChoiceElement.shuffledPossibleAnswers)
                    multipleChoicesElementsArray.push(multipleChoiceElement)

                    //remove the open bracket, the bad good and bad answers and the closing bracket
                    textAreaDestination.remove(openingBracketPosInDestTextArea+questionLength+1,closingBracketPosInDestTextArea+1)
                    textAreaDestination.remove(openingBracketPosInDestTextArea,openingBracketPosInDestTextArea+1)

                    //color the "question" text
                    destDocument.selectionStart = openingBracketPosInDestTextArea
                    destDocument.selectionEnd = openingBracketPosInDestTextArea+questionLength
                    destDocument.cursorPosition = openingBracketPosInDestTextArea
                    destDocument.textColor = "blue"

                    nbOfCharactersRemoved = nbOfCharactersRemoved + (closingBracketPos - openingBracketPos - questionLength +1)

                }
                scoreScreen.text = "Score : 0/" + multipleChoicesElementsArray.length
            }
            answerFieldsPrepared = true
        }


        function deleteAnswerChoices() {
            for (var i=0; i<textAreaDestination.multipleChoicesElementsArray.length; i++) {

                //prepare the positions of the questions
                var currentMultipleChoicesElements = textAreaDestination.multipleChoicesElementsArray[i]
                var wordStartPos = currentMultipleChoicesElements.posInText// + nbOfChartoAdd
                var wordEndPos = wordStartPos + currentMultipleChoicesElements.question.length-1

                //prepare an array containing all the possible answers
//                var multipleChoicesArray = textAreaDestination.multipleChoicesElementsArray[i].goodAnswers.concat(textAreaDestination.multipleChoicesElementsArray[i].badAnswers)

                //find what is the longest choice in choicesArray and insert it in the text to prepare the place for the ComboBox
//                var longestChoiceStr = longestStrInArray(multipleChoicesArray)

                //delete the dummy answered written to reserve the combo box place
                textAreaDestination.remove(wordEndPos+1, wordEndPos+1 + textAreaDestination.multipleChoicesElementsArray[i].longestChoiceStr.length+3)

                              //  console.log("longestChoiceStr: %1 - longestChoiceStrLength: %2".arg(longestChoiceStr).arg(longestChoiceStr.length))

                              //  textAreaDestination.insert(wordEndPos+1, "#")
                              //  textAreaDestination.insert(wordEndPos+1 + longestChoiceStr.length+5, "#")
            }
            answerChoicesComboBoxesRepeater.model = []
        }


        function insertSuccessAndFailMark(result, choiceNumber) {

            textAreaDestination.resultMarkStrInserted = true

            var resultMarkStr = "<span style=\"color:green; font-size:%1pt;\"><pre> &#10004;</pre></span>".arg(textAreaDestination.multipleChoicesElementsArray[choiceNumber].answerFontSize)
            if (result == false) {
                resultMarkStr = "<span style=\"color:red; font-size:%1pt;\"><pre> &#10060;</pre></span>".arg(textAreaDestination.multipleChoicesElementsArray[choiceNumber].answerFontSize)
            }

            var resultMarkStrPos = textAreaDestination.multipleChoicesElementsArray[choiceNumber].posInDestText + textAreaDestination.multipleChoicesElementsArray[choiceNumber].longestChoiceStr.length + 1

            //var answerStr = "<span style=\"color:red; font-size:%1pt;\"><pre>%2</pre></span>".arg(fontSize).arg(insertedLongestString)
            textAreaDestination.insert(resultMarkStrPos, resultMarkStr)

            // shift the next multiple choices places from two chars: a blanck and the answerMark character
            for (var i = choiceNumber+1; i<textAreaDestination.multipleChoicesElementsArray.length; i++) {
                textAreaDestination.multipleChoicesElementsArray[i].posInDestText = textAreaDestination.multipleChoicesElementsArray[i].posInDestText + 2
            }
        }


        
        
        function deleteSuccessAndFailMark() {

            if (textAreaDestination.resultMarkStrInserted) {
                for (var i = 0; i<textAreaDestination.multipleChoicesElementsArray.length; i++) {

                    var resultMarkStrPos = textAreaDestination.multipleChoicesElementsArray[i].posInDestText + textAreaDestination.multipleChoicesElementsArray[i].longestChoiceStr.length + 1

                    textAreaDestination.remove(resultMarkStrPos,resultMarkStrPos+2)

                    // shift the next multiple choices places from two chars: a blanck and the answerMark character
                    for (var j = i+1; j<textAreaDestination.multipleChoicesElementsArray.length; j++) {
                        textAreaDestination.multipleChoicesElementsArray[j].posInDestText = textAreaDestination.multipleChoicesElementsArray[j].posInDestText - 2
                    }
                }
            }
            textAreaDestination.resultMarkStrInserted = false
        }


        function checkAnswers() {

            if (textAreaDestination.resultMarkStrInserted) {
                textAreaDestination.deleteSuccessAndFailMark()
            }

            var score = 0
            for (var i = 0; i<textAreaDestination.multipleChoicesElementsArray.length; i++) {



                var goodAnswers = textAreaDestination.multipleChoicesElementsArray[i].goodAnswers
                var comboBoxValue = textAreaDestination.multipleChoicesElementsArray[i].comboBoxValue
                var shuffledVar = textAreaDestination.multipleChoicesElementsArray[i].shuffledPossibleAnswers
             //   console.log("goodAnswers")
             //   console.log(goodAnswers)
             //   console.log("comboBoxValue")
             //   console.log(comboBoxValue)
                console.log("shuffled var " + i + ":")
                console.log(shuffledVar)
                var result = goodAnswers.indexOf(comboBoxValue);
                if (result != -1) {
                    textAreaDestination.insertSuccessAndFailMark(true, i)
                    score = score + 1
                }
                else
                {
                    textAreaDestination.insertSuccessAndFailMark(false, i)
                }


            }
            textAreaDestination.insertMultipleChoiceBoxes()
            scoreScreen.text = "Score : " + score + "/" + multipleChoicesElementsArray.length


        }



        function insertSpaceForMultipleChoiceBoxes() {

            var nbOfCharToAdd = 0
            for (var i = 0; i<textAreaDestination.multipleChoicesElementsArray.length; i++) {

                    //create character spaces for the combo box

                //store the question start and end position
                var currentMultipleChoicesElements = textAreaDestination.multipleChoicesElementsArray[i]
                var wordStartPos = currentMultipleChoicesElements.posInText
                var wordEndPos = wordStartPos + currentMultipleChoicesElements.question.length-1

                //read and store the question characters family and size
                destDocument.cursorPosition = wordStartPos
                destDocument.selectionStart = wordStartPos
                destDocument.selectionEnd = wordEndPos
                var fontSize = destDocument.fontSize
                textAreaDestination.multipleChoicesElementsArray[i].answerFontSize = fontSize
                var fontFamily = destDocument.fontFamily
                textAreaDestination.multipleChoicesElementsArray[i].answerFontFamily = fontFamily

                //console.log("+++++++**++++++++" + textAreaDestination.multipleChoicesElementsArray[i].userAnswer)

                //find what is the longest choice in choicesArray and insert it in the text to prepare the place for the ComboBox
                var insertedLongestString = " " + textAreaDestination.multipleChoicesElementsArray[i].longestChoiceStr
                var insertedLongestStringLength = insertedLongestString.length

                var answerStr = "<span style=\"color:red; font-size:%1pt;\"><pre>%2</pre></span>".arg(fontSize).arg(insertedLongestString)
                var choiceStrPosition = wordEndPos + 1 + nbOfCharToAdd
                textAreaDestination.insert(choiceStrPosition, answerStr)
                textAreaDestination.multipleChoicesElementsArray[i].posInDestText = choiceStrPosition
                nbOfCharToAdd = nbOfCharToAdd + insertedLongestStringLength
            }

        }

        function insertMultipleChoiceBoxes() {
            for (var i = 0; i<textAreaDestination.multipleChoicesElementsArray.length; i++) {

                //store the multiple choices answers positions in array to be used in model
                var comboBoxPos = textAreaDestination.multipleChoicesElementsArray[i].posInDestText
                var rect = textAreaDestination.positionToRectangle(comboBoxPos+1)
                textAreaDestination.multipleChoicesElementsArray[i].posInDestTextX = rect.x
                textAreaDestination.multipleChoicesElementsArray[i].posInDestTextY = rect.y

                //calculate choices answers width to set combobox width
                destDocument.cursorPosition = comboBoxPos+3
                destDocument.selectionStart = comboBoxPos +3
                destDocument.selectionEnd = comboBoxPos+4
                var stringWidth = destDocument.stringWidth
                textAreaDestination.multipleChoicesElementsArray[i].comboboxWidth = stringWidth
            }

            answerChoicesComboBoxesRepeater.model = textAreaDestination.multipleChoicesElementsArray
        }


        function deleteMultipleChoiceBoxes() {
            answerChoicesComboBoxesRepeater.model = []
        }





        //frameVisible: false
        width: parent.width
        height: parent.height/3
        anchors.top: textArea.bottom
        text: document.text
        textFormat: Qt.RichText
        //Component.onCompleted: forceActiveFocus()


      /*  flickableItem.onContentYChanged: {
            console.log("xxxxxx")
            displayAnswerChoices()
        }*/

        onWidthChanged: {
    //        textAreaDestination.displayAnswerChoices()
        }

        onCursorPositionChanged: {

            //textAreaDestination.selectWord()
            var fontFamily = textAreaDestination.font.family
            //fontFamily = "sens serif"
            var fontSize = textAreaDestination.font.pointSize
            //fontSize = 100
           // console.log("++++++++++++++++++fontFamily: " + fontFamily)
           // console.log("++++++++++++++++++fontSize: " + fontSize)



           /* for (var i = 0; i < textAreaDestination.multipleChoicesElementsArray.length; i++) {

                var currentMultipleChoicesElements = textAreaDestination.multipleChoicesElementsArray[i]
                var tmp3 = currentMultipleChoicesElements.posInDestText
                console.log("kkkkkkkk " + i + " :" + tmp3)


                var rect = textAreaDestination.positionToRectangle(tmp3)
                console.log("xxxxxxxxxxx " + i + " :" + rect.x)
                console.log("yyyyyyyyyyy " + i + " :" + rect.y)
//                var rect = textAreaDestination.positionToRectangle(openingBracketPosInDestTextArea)
                textAreaDestination.multipleChoicesElementsArray[i].posInTextX = rect.x// - rect.width
                console.log("posInTextX: " + rect.x)

                textAreaDestination.multipleChoicesElementsArray[i].posInTextY = rect.y + rect.height //+ / //mainToolBar.height + appWin.height/3 + 24 -100
           //     console.log("posInTextY: " + textAreaDestination.multipleChoicesElementsArray[i].posInTextY)




            }*/
//            var rect2 = textAreaDestination.positionToRectangle(cursorPosition)
//            errorMessage.text = cursorPosition + "--: " + rect2.x
        }





        Item {
            id: answerChoicesComboBoxes

            anchors.top: textAreaDestination.top
            anchors.left: textAreaDestination.left

            z: 100

            Repeater {
                id: answerChoicesComboBoxesRepeater

                anchors.top: textAreaDestination.top
                anchors.left: textAreaDestination.left

                ComboBox {
                    id: box
                    activeFocusOnPress: true
                    currentIndex: textAreaDestination.multipleChoicesElementsArray[index].comboBoxIndex

                    style: ComboBoxStyle {
                        id: comboBox
                        background: Rectangle {
                            id: rectCategory
                            radius: 5
                            border.width: 2
                            color: "#fff"
                        }
                        label: Text {
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pointSize: modelData.answerFontSize
                            font.family: modelData.answerFontFamily
                            font.capitalization: Font.SmallCaps
                            color: "black"
                            text: control.currentText
                        }

                        // drop-down customization here
                        property Component __dropDownStyle: MenuStyle {
                            __maxPopupHeight: 600
                            __menuItemType: "comboboxitem"

                            frame: Rectangle {              // background
                                color: "#fff"
                                border.width: 2
                                radius: 5
                            }

                            itemDelegate.label:             // an item text
                                Text {
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                font.pointSize: 15
                                font.family: "Courier"
                                font.capitalization: Font.SmallCaps
                                color: styleData.selected ? "white" : "black"
                                text: styleData.text
                            }

                            itemDelegate.background: Rectangle {  // selection of an item
                                radius: 2
                                color: styleData.selected ? "darkGray" : "transparent"
                            }

                            __scrollerStyle: ScrollViewStyle { }
                        }

                        property Component __popupStyle: Style {
                            property int __maxPopupHeight: 400
                            property int submenuOverlap: 0

                            property Component frame: Rectangle {
                                width: (parent ? parent.contentWidth : 0)
                                height: (parent ? parent.contentHeight : 0)// + 1
                                border.color: "black"
                                property real maxHeight: 500
                                property int margin: 1
                            }

                            property Component menuItemPanel: Text {
                                text: "NOT IMPLEMENTED"
                                color: "red"
                                font {
                                    pixelSize: 14
                                    bold: true
                                }
                            }

                            property Component __scrollerStyle: null
                        }
                    }

                    model: modelData.shuffledPossibleAnswers
                    width: modelData.comboboxWidth
                   // currentIndex: modelData.comboBoxValue
                    z: 10000
                    x: modelData.posInDestTextX
                    y: modelData.posInDestTextY-4



                    onCurrentTextChanged: {
                        //console.log("------- modelData: " + index)
                        textAreaDestination.multipleChoicesElementsArray[index].comboBoxValue = currentText
                        textAreaDestination.multipleChoicesElementsArray[index].comboBoxIndex = currentIndex
                        //console.log("------- comboboxvalue" + textAreaDestination.multipleChoicesElementsArray[index].comboBoxValue)
                    }
                }
            }
        }
    }




    Text {
        id: errorMessage

        //    anchors.top: textAreaDestination.bottom
        anchors.bottom: errorMessage2.top
        height: parent.height/100
    }

    Text {
        id: errorMessage2

        anchors.top: errorMessage.bottom
        anchors.bottom: parent.bottom
        height: parent.height/100
    }


    MessageDialog {
        id: errorDialog

    }

    DocumentHandler {
        id: document
        target: textArea
        cursorPosition: textArea.cursorPosition
        selectionStart: textArea.selectionStart
        selectionEnd: textArea.selectionEnd
        textColor: colorDialog.color
        Component.onCompleted: document.fileUrl = "qrc:/example.html"
        onFontSizeChanged: {
            fontSizeSpinBox.valueGuard = false
            fontSizeSpinBox.value = document.fontSize
            fontSizeSpinBox.valueGuard = true
        }
        onFontFamilyChanged: {
            var index = Qt.fontFamilies().indexOf(document.fontFamily)
            if (index == -1) {
                fontFamilyComboBox.currentIndex = 0
                fontFamilyComboBox.special = true
            } else {
                fontFamilyComboBox.currentIndex = index
                fontFamilyComboBox.special = false
            }
        }
        onError: {
            errorDialog.text = message
            errorDialog.visible = true
        }

    }

    DocumentHandler {
        id: destDocument
        target: textAreaDestination
        cursorPosition: textAreaDestination.cursorPosition
        selectionStart: textAreaDestination.selectionStart
        selectionEnd: textAreaDestination.selectionEnd
        textColor: colorDialog.color
        //Component.onCompleted: document.fileUrl = "qrc:/example.html"
        onFontSizeChanged: {
            fontSizeSpinBox.valueGuard = false
            fontSizeSpinBox.value = destDocument.fontSize
            fontSizeSpinBox.valueGuard = true
        }
        onFontFamilyChanged: {
            var index = Qt.fontFamilies().indexOf(destDocument.fontFamily)
            if (index == -1) {
                fontFamilyComboBox.currentIndex = 0
                fontFamilyComboBox.special = true
            } else {
                fontFamilyComboBox.currentIndex = index
                fontFamilyComboBox.special = false
            }
        }
        onError: {
            errorDialog.text = message
            errorDialog.visible = true
        }

    }
}
