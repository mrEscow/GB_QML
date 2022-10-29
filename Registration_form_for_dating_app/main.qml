import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Registration form")

    readonly property color bgColor: "#303a52"
    readonly property color mainBubbleColor: "#574b90"
    readonly property color secondBubbleColor: "#4B99A0"
    readonly property color componentColor: "#85B4B7"
    readonly property color textColor: "#fc85ae"
    readonly property color buttonsColor: "#5FBEC4"
    readonly property color buttonTextColor: "#466F72"

    property string _email
    property string _password
    property string _userName
    property int _userAge
    property string _userGender
    property string _userCountry
    property string _userCity
    property string _userEducation
    property string _userHobby
    property string _userAbout
    property string _preferredGander
    property int _preferredMinAge
    property int _preferredManAge

    function clenDate(){
        _email = ""
        _password = ""
        _userName = ""
        _userAge = 0
        _userGender = ""
        _userCountry = ""
        _userCity = ""
        _userEducation = ""
        _userHobby = ""
        _userAbout = ""
        _preferredGander = ""
        _preferredMinAge = 0
        _preferredManAge = 0
    }

    function printUser(user){
        console.log("==============");
        console.log(user.id);
        console.log(user.mail);
        console.log(user.password);
        console.log(user.userDate.name);
        console.log(user.userDate.age);
        console.log(user.userDate.gender);
        console.log(user.userDate.country);
        console.log(user.userDate.sity);
        console.log(user.userDate.education);
        console.log(user.userDate.hobby);
        console.log(user.userDate.about);
        console.log(user.userDate.preferred.gender);
        console.log(user.userDate.preferred.minAge);
        console.log(user.userDate.preferred.maxAge);
        console.log("**************");
    }

    function createUser(){
        var user = {
            id : 1,
            mail: _email,
            password: _password,
            userDate: {
                name: _userName,
                age: _userAge,
                gender: _userGender,
                country: _userCountry,
                sity: _userCity,
                education: _userEducation,
                hobby: _userHobby,
                about: _userAbout,
                preferred: {
                    gender: _preferredGander,
                    minAge: _preferredMinAge,
                    maxAge:  _preferredManAge
                }
            }
        }
        return user;
    }

    Rectangle {
        anchors.fill: parent
        color: bgColor

        Text {
            id: label
            anchors.top: parent.top
            anchors.topMargin: 9
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Регистрация"
            font.bold: true
            font.italic: true
            font.pixelSize: parent.width * 0.06
            color: textColor
        }

        StackView {
            id: stackView
            anchors.fill: parent
            initialItem: firstPage
        }

        FirstPage {
            id: firstPage
            visible: false

            leftButtonName: "Выход   "
            rightButtonName: " Продолжить"

            onLeftButtonClicked: {
                close();
            }
            onRightButtonClicked: {

                if( userName === "" && userGender === "М/Ж" ){
                    failNameAnim.start()
                    failGenderAnim.start()
                    return;
                }

                if(userName === ""){
                    failNameAnim.start()
                    return
                }

                if(userGender === "М/Ж"){
                    failGenderAnim.start()
                    return;
                }

                _userName = userName;
                _userAge = userAge
                _userGender = userGender

                console.log(_userName)
                console.log(_userAge)
                console.log(_userGender)

                stackView.push(secondPage);
            }
        }

        SecondPage {
            id: secondPage
            visible: false
            leftButtonName: "Вернуться   "
            rightButtonName: " Продолжить"
            onLeftButtonClicked: {
                stackView.pop()
            }
            onRightButtonClicked: {
                _userCountry = userCountry
                _userCity = userCity

                console.log(_userCountry)
                console.log(_userCity)

                stackView.push(thirdPage)
            }
        }

        ThirdPage {
            id: thirdPage
            visible: false
            leftButtonName: "Вернуться   "
            rightButtonName: " Продолжить"
            onLeftButtonClicked: {
                stackView.pop()
            }
            onRightButtonClicked: {
                _userEducation =  userEducation
                _userHobby = userHobby

                console.log(_userEducation)
                console.log(_userHobby)

                stackView.push(fourthPage)
            }
        }

        FourthPage {
            id: fourthPage
            visible: false
            leftButtonName: "Вернуться   "
            rightButtonName: " Продолжить"
            onLeftButtonClicked: {
                stackView.pop()
            }
            onRightButtonClicked: {
                _userAbout = userAbout

                console.log(_userAbout)

                stackView.push(fifthPage)
            }
        }

        FifthPage {
            id: fifthPage
            visible: false
            leftButtonName: "Вернуться   "
            rightButtonName: " Продолжить"
            onLeftButtonClicked: {
                stackView.pop()
            }
            onRightButtonClicked: {
                if(preferredGander === "М/Ж"){
                    failGenderAnim.start()
                    return;
                }

                _preferredGander = preferredGander;
                _preferredMinAge = preferredMinAge
                _preferredManAge = preferredManAge

                console.log(_preferredGander)
                console.log(_preferredMinAge)
                console.log(_preferredManAge)

                stackView.push(endPage)
            }
        }

        EndPage {
            id: endPage
            visible: false
            leftButtonName: "Вернуться   "
            rightButtonName: " Зарегистрироваться"
            onLeftButtonClicked: {
                stackView.pop()
            }
            onRightButtonClicked: {

                if(email.search(/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/) !== 0){
                    failEmailAnim.start();
                    return;
                }

                if(password.length < 8 || password !== password2){
                    failPasswordsAnim.start();
                    return;
                }


                _email = email
                _password = password

                console.log(_email)
                console.log(_password)

                var newUser = createUser()
                printUser(newUser);
                clenDate()


                stackView.pop(null)
            }
        }
    }
}
