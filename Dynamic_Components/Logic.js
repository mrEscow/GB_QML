function createSingInForm(mainWindow) {
    let component;
    let sprite;

    component = Qt.createComponent("SingInForm.qml");
    sprite = component.createObject(mainWindow);

    if (sprite == null) {
        console.log("Error creating object");
    }
}

function  checkCreditals(login, password){
    if(login === "admin" && password === "admin")
        isInput = true;
    else
        isInput = false;
    return isInput;
}

function loadApp() {
    loader.sourceComponent = comp
}
