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
        id: createWikiAnswerChoices
        text: "c&reate multiple answer"
        iconSource: "images/createmultianswerchoices.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.prepareAnswerFields()
        }
    }

    Action {
        id: createCheckAnswers
        text: "c&reate multiple answer"
        iconSource: "images/ok.png"
        iconName: "xxx"
        onTriggered: {
            textAreaDestination.checkAnswers()
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

            ToolButton { action: createWikiAnswerChoices }

            ToolButton { action: createCheckAnswers }

            Item { Layout.fillWidth: true }
        }
    }

    ToolBar {
        id: secondaryToolBar
        width: parent.width

        RowLayout {
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
            textAreaDestination.text = textArea.text
            textAreaDestination.prepareAnswerFields()
        }

    }


    Item {
        id: answerChoices

        property var answerChoicesIndex

        z: 100

        Grid {
            id: answerChoicesGrid

            columns: 1
            spacing: 2

            Repeater {
                id: answerChoicesGridRepeater

                Rectangle {
                    id: answerFieldRect
                    width: answerChoicesText.width + 10
                    height: answerChoicesText.height + 10
                    color: "red"

                    Text {
                        id: answerChoicesText

                        text: modelData
                        anchors.horizontalCenter: answerFieldRect.horizontalCenter
                        anchors.verticalCenter: answerFieldRect.verticalCenter
                        font.pointSize: 12
                    }

                    MouseArea {

                        width: parent.width
                        height: parent.height
                        onClicked: {
                          console.log("test index " + answerChoices.answerChoicesIndex)
                          console.log("textAreaDestination.multipleChoicesElementsArray[index].question :" + textAreaDestination.multipleChoicesElementsArray[answerChoices.answerChoicesIndex].question)
                          console.log("textAreaDestination.multipleChoicesElementsArray[index].goodAnswers :" + textAreaDestination.multipleChoicesElementsArray[answerChoices.answerChoicesIndex].goodAnswers)

                          textAreaDestination.multipleChoicesElementsArray[answerChoices.answerChoicesIndex].userAnswer = modelData

                          console.log("////*****" + textAreaDestination.multipleChoicesElementsArray[answerChoices.answerChoicesIndex].userAnswer)

                        }
                    }
                }
            }
        }
    }

    TextArea {
        Accessible.name: "destDocument"
        id: textAreaDestination

        property var multipleChoicesElementsArray : []


        function prepareAnswerFields() {
            textAreaDestination.text = textArea.text
            console.log("ça marche")


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
                    console.log("openingBracketPosition: " + openingBracketPos)
                    console.log("closingBracketPosition: " + closingBracketPos)
                    console.log("openingBracketPosInDestTextArea: " + openingBracketPosInDestTextArea)
                    console.log("closingBracketPosInDestTextArea: " + closingBracketPosInDestTextArea)

                    //extract the question, good and bad answers from multiple choices infos
                    var multipleChoiceElementStr = textArea.getText(openingBracketPos+1,closingBracketPos)
                    console.log("multipleChoiceElement: " + multipleChoiceElementStr)
                    var questionStr
                    var goodAnswersArray = []
                    var badAnswersArray = []
                    var multipleChoiceElementStrArray = multipleChoiceElementStr.split("|")
                    console.log("--- multipleChoiceElementStrArray: " + multipleChoiceElementStrArray)
                    for (var j = 0; j < multipleChoiceElementStrArray.length; j++) {
                        if (j == 0) {
                            questionStr = multipleChoiceElementStrArray[0]
                        }
                        else
                        {
                            console.log("+-+-+------"+multipleChoiceElementStrArray[j])
                            if (multipleChoiceElementStrArray[j][multipleChoiceElementStrArray[j].length-1] == "*") {
                                multipleChoiceElementStrArray[j] = multipleChoiceElementStrArray[j].substr(0,multipleChoiceElementStrArray[j].length-1)
                                goodAnswersArray.push(multipleChoiceElementStrArray[j])                                
                            }
                            else {
                                badAnswersArray.push(multipleChoiceElementStrArray[j])
                            }
                        }
                    }

                    var goodAnwerVar = []
                    //store the for each question, its position, its good and bad answers
                    var multipleChoiceElement = {posInText:0, question:"", questionLength:0, goodAnswers:[], badAnswers:[], userAnswer:""}
                    multipleChoiceElement.posInText = openingBracketPosInDestTextArea
                    multipleChoiceElement.question = questionStr
                    var questionLength = questionStr.length
                    multipleChoiceElement.questionLength = questionLength
                    multipleChoiceElement.goodAnswers = goodAnswersArray
                    multipleChoiceElement.badAnswers = badAnswersArray
                    multipleChoicesElementsArray.push(multipleChoiceElement)

                    console.log("--- multipleChoiceElement.question: " + multipleChoiceElement.question)
                    console.log("--- multipleChoiceElement.goodAnswers: " + multipleChoiceElement.goodAnswers)
                    console.log("--- multipleChoiceElement.badAnswers: " + multipleChoiceElement.badAnswers)


                    //remove the open bracket, the bad good and bad answers and the closing bracket
                    textAreaDestination.remove(openingBracketPosInDestTextArea+questionLength+1,closingBracketPosInDestTextArea+1)
                    textAreaDestination.remove(openingBracketPosInDestTextArea,openingBracketPosInDestTextArea+1)

                    //color the "question" text
                    destDocument.selectionStart = openingBracketPosInDestTextArea
                    destDocument.selectionEnd = openingBracketPosInDestTextArea+questionLength
                    destDocument.cursorPosition = openingBracketPosInDestTextArea
                    destDocument.textColor = "blue"

                    nbOfCharactersRemoved = nbOfCharactersRemoved + (closingBracketPos - openingBracketPos - questionLength +1)
                    console.log("nbOfCharactersRemoved: " + nbOfCharactersRemoved)
                }
            }


/*            //display the multiple choices answerFields
            for (var i = 0; i < multipleChoicesElementsArray.length; i++) {
                console.log("--- multipleChoicesElementsArray posInText: " + multipleChoicesElementsArray[i].posInText)
                console.log("--- multipleChoicesElementsArray question: " + multipleChoicesElementsArray[i].question)
                console.log("--- multipleChoicesElementsArray goodAnswers: " + multipleChoicesElementsArray[i].goodAnswers)
                console.log("--- multipleChoicesElementsArray badAnswers: " + multipleChoicesElementsArray[i].badAnswers)

                var rect = textAreaDestination.positionToRectangle(multipleChoicesElementsArray[i].posInText)
                console.log(rect)
                answerChoices.visible = true

            }*/
        }

        function displayAnswerChoices() {
            console.log("il y a ... ekements" + textAreaDestination.multipleChoicesElementsArray.length)
            for (var i = 0; i < textAreaDestination.multipleChoicesElementsArray.length; i++) {

                var wordStartPos = textAreaDestination.multipleChoicesElementsArray[i].posInText
                var wordEndPos = wordStartPos + textAreaDestination.multipleChoicesElementsArray[i].questionLength

                console.log("cursorPosition: " + cursorPosition + " -- wordStartPos" + wordStartPos + " -- wordEndPos" + wordEndPos)

                if (cursorPosition >= wordStartPos && cursorPosition <= wordEndPos) {

                    console.log("----detected : cursorPosition: " + cursorPosition + " -- wordStartPos" + wordStartPos + " -- wordEndPos" + wordEndPos + " i: " + i)
                    console.log("----question: " + textAreaDestination.multipleChoicesElementsArray[i].question)
                    console.log("----good answers: " + textAreaDestination.multipleChoicesElementsArray[i].goodAnswers)
                    console.log("----bad answers: " + textAreaDestination.multipleChoicesElementsArray[i].badAnswers)

                    var multipleChoicesArray = textAreaDestination.multipleChoicesElementsArray[i].goodAnswers.concat(textAreaDestination.multipleChoicesElementsArray[i].badAnswers)
                    console.log("----multipleChoicesArray: " + multipleChoicesArray)

                    var rect = textAreaDestination.positionToRectangle(wordStartPos)
                    answerChoicesGridRepeater.model = multipleChoicesArray
                    answerChoicesGrid.visible = true
                    answerChoicesGrid.x = rect.x - rect.width
                    answerChoicesGrid.y = rect.y + rect.height + textArea.height + mainToolBar.height
                    answerChoices.answerChoicesIndex = i

                    console.log(rect.y)
                    console.log(textArea.height)
                    console.log(rect.y + textArea.height + mainToolBar.height)
                    console.log(mainToolBar.height)

                 }
            }
        }

        function checkAnswers() {
            for (var i = 0; i < textAreaDestination.multipleChoicesElementsArray.length; i++) {
                var currentChoicesElements = textAreaDestination.multipleChoicesElementsArray[2]

                console.log("currentChoicesElements question  " + currentChoicesElements.question)
                console.log("currentChoicesElements userAnswer " + currentChoicesElements.userAnswer)
                if (currentChoicesElements.goodAnswers.indexOf(currentChoicesElements.userAnswer) != -1)
                {
                    textAreaDestination.remove(currentChoicesElements.posInText,currentChoicesElements.posInText+currentChoicesElements.question.length)
                    textAreaDestination.insert(currentChoicesElements.posInText,"<font color=\"red\">" + currentChoicesElements.userAnswer +  "</font>")
                }

            }

        }



        //frameVisible: false
        width: parent.width
        height: parent.height/3
        anchors.top: textArea.bottom
        text: "tt" //document.text
        textFormat: Qt.RichText
        Component.onCompleted: forceActiveFocus()


        flickableItem.onContentYChanged: {
            console.log("xxxxxx")
            displayAnswerChoices()
        }

        onCursorPositionChanged: {

            displayAnswerChoices()
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
