/* GCompris - texteditor.js
 *
 * Copyright (C) 2014 Emmanuel Charruau
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (GTK+ version)
 *   Emmanuel Charruau <echarruau@gmail.com> (Qt Quick port)
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (Major rework)
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, see <http://www.gnu.org/licenses/>.
 */
.pragma library
.import QtQuick 2.0 as Quick
.import GCompris 1.0 as GCompris //for ApplicationInfo

var items

function start(items_) {
    items = items_
}


/*function searchMultipleAnswerFieldStart(cursorPosition) {
    for (var i = cursorPosition; i >= 0; i--) {
        var oneTextChar = items.textArea.getText(i,i+1)
        if (oneTextChar == "]") {
            return -1
        }
        if (oneTextChar == "[") {
            var multiAnswerFieldStartPos = i
            console.log("test:" + multiAnswerFieldStartPos)
            return multiAnswerFieldStartPos
        }
    }
    return -1
}*/

/*function searchMultipleAnswerFieldEnd(cursorPosition) {
    for (var i = cursorPosition; i < items.textArea.length-2; i++) {
        var oneTextChar = items.textArea.getText(i,i+1)
        if (oneTextChar == "[") {
            return -1
        }
        if (oneTextChar == "]") {
            var multiAnswerFieldEndPos = i
            console.log("found ] pos " + i)
            return multiAnswerFieldEndPos
        }
    }
    return -1
}


var newStartAndEndPosAnswerField = function(currentCursorPosition) {

    var isAnswerField = false
    var startPosAnswerField = -1
    var endPosAnswerField = -1

    startPosAnswerField = searchMultipleAnswerFieldStart(currentCursorPosition)
    endPosAnswerField = searchMultipleAnswerFieldEnd(currentCursorPosition)

    //if the user clicked outside of brackets, escape the action
    if (startPosAnswerField == -1 || endPosAnswerField == -1) {
        return {
            isAnswerField: isAnswerField,
            startPosAnswerField: startPosAnswerField,
            endPosAnswerField: endPosAnswerField
        }
    }

    isAnswerField = true

    return {
        isAnswerField: isAnswerField,
        startPosAnswerField: startPosAnswerField,
        endPosAnswerField: endPosAnswerField
    }
}*/
