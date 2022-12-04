// GET pet/findByStatus
function getPets(){
    let request = new XMLHttpRequest();
    let status;

    request.onreadystatechange = function() {
        if (request.readyState == XMLHttpRequest.DONE ) {

            console.log(request.status)

            status = request.status
            responseStatus = status

            if (status >= 200 && status <= 299){
                console.log("STATUS:", status)
                responseStatusColor = "green"
                parsePets(request.responseText)
            }
        }
    }

    const url = getUrlByStatus()
    request.open("GET", url, true);
    request.send();
}

function getUrlByStatus(){

    let url = swagger + findByStatus

    if(availableCheckBox.checkState === Qt.Checked)
        url += "status=available"

    if(pendingCheckBox.checkState === Qt.Checked){
        if(availableCheckBox.checkState === Qt.Checked)
            url += "&"
        url += "status=pending"
    }

    if(soldCheckBox.checkState === Qt.Checked){
        if(availableCheckBox.checkState === Qt.Checked || pendingCheckBox.checkState === Qt.Checked)
            url += "&"
        url += "status=sold"
    }

    console.log("URL:", url)

    return url
}

function parsePets(response){
    listModel.clear()
    let jsonPetsArrey = []
    jsonPetsArrey = JSON.parse(response);
    jsonPetsArrey.forEach(element => {
                              let x ={
                                  "id": element.id,
                                  "category": {
                                      "id": element.category.id,
                                      "name": element.category.name
                                  },
                                  "name": element.name,
                                  "photoUrl": element.photoUrls[0],
                                  "status": element.status
                              }
                              listModel.append(x)
                          })
    labelName.text = listModel.get(swiper.currentIndex).name
    labelId.text = "id:" + listModel.get(swiper.currentIndex).id

}


//////////////////////////////////////////////////
//        {
//          "id": 0,
//          "category": {
//            "id": 0,
//            "name": "string"
//          },
//          "name": "doggie",
//          "photoUrls": [
//            "string"
//          ],
//          "tags": [
//            {
//              "id": 0,
//              "name": "string"
//            }
//          ],
//          "status": "available"
//        }
//////////////////////////////////////////////////

function addPet(){
    let request = new XMLHttpRequest();
    let status;

    request.onreadystatechange = function() {
        if (request.readyState == XMLHttpRequest.DONE ) {

            console.log(request.status)

            status = request.status
            responseStatus = status

            if (status >= 200 && status <= 299){
                console.log("STATUS:", status)
                responseStatusColor = "green"
                parseOnePet(request.responseText)
            }

            if (status >= 400 && status <= 499){
                console.log("STATUS:", status)
                responseStatusColor = "yellow"
                print(request.responseText)
            }

            if (status >= 500 && status <= 599){
                console.log("STATUS:", status)
                responseStatusColor = "red"
                print(request.responseText)
            }
        }
    }



    const url = swagger + "pet"
    request.open("POST", url, true);

    request.setRequestHeader('Content-type', 'application/json; charset=utf-8');


    switch(dialogStatus.currentText){
    case "Доступный":
        status = "available"
        break
    case "Забронированый":
        status = "pending"
        break
    case "На_продажу":
        status = "sold"
        break
    }

    const body =JSON.stringify(
                   {
                       "id": dialogId.text,
                       "category": {
                           "id": 0,
                           "name": "string"
                       },
                       "name": dialogName.text,
                       "photoUrls": [
                           dialogImage.text
                       ],
                       "tags": [
                           {
                               "id": 0,
                               "name": "string"
                           }
                       ],
                       "status": status
                   })

    request.send(body);
}

function parseOnePet(response){
    listModel.clear()

    availableCheckBox.checked = false
    pendingCheckBox.checked = false
    soldCheckBox.checked = false

    let jsonPet = JSON.parse(response);

    let x ={
        "id": jsonPet.id,
        "category": {
            "id": jsonPet.category.id,
            "name": jsonPet.category.name
        },
        "name": jsonPet.name,
        "photoUrl": jsonPet.photoUrls[0],
        "status": jsonPet.status
    }

    listModel.append(x)

    labelName.text = listModel.get(swiper.currentIndex).name
    labelId.text = "id:" + listModel.get(swiper.currentIndex).id


}
//////////////////////////////////////////////////
function findPetByID(id){
    let request = new XMLHttpRequest();
    let status;

    request.onreadystatechange = function() {
        if (request.readyState == XMLHttpRequest.DONE ) {

            console.log(request.status)

            status = request.status
            responseStatus = status

            if (status >= 200 && status <= 299){
                console.log("STATUS:", status)
                responseStatusColor = "green"
                parseOnePet(request.responseText)
            }

            if (status >= 400 && status <= 499){
                console.log("STATUS:", status)
                responseStatusColor = "yellow"
                print(request.responseText)
            }

            if (status >= 500 && status <= 599){
                console.log("STATUS:", status)
                responseStatusColor = "red"
                print(request.responseText)
            }
        }
    }

    const url = swagger + "pet/" + id
    request.open("GET", url, true);
    request.send();
}

//////////////////////////////////////////////////
function updateImage(id){
    let request = new XMLHttpRequest();
    let status;

    request.onreadystatechange = function() {
        if (request.readyState == XMLHttpRequest.DONE ) {

            console.log(request.status)

            status = request.status
            responseStatus = status

            if (status >= 200 && status <= 299){
                console.log("STATUS:", status)
                responseStatusColor = "green"
                parseOnePet(request.responseText)
            }

            if (status >= 400 && status <= 499){
                console.log("STATUS:", status)
                responseStatusColor = "yellow"
                print(request.responseText)
            }

            if (status >= 500 && status <= 599){
                console.log("STATUS:", status)
                responseStatusColor = "red"
                print(request.responseText)
            }
        }
    }



    const url = swagger + "pet"
    request.open("PUT", url, true);

    request.setRequestHeader('Content-type', 'application/json; charset=utf-8');




    const body =JSON.stringify(
                   {
                       "id": dialogId3.text,
                       "category": {
                           "id": 0,
                           "name": "string"
                       },
                       "name": listModel.get(swiper.currentIndex).name,
                       "photoUrls": [
                           dialogImage2.text
                       ],
                       "tags": [
                           {
                               "id": 0,
                               "name": "string"
                           }
                       ],
                       "status": listModel.get(swiper.currentIndex).status
                   })

    request.send(body);
}

//////////////////////////////////////////////////
function deletePet(id){
    let request = new XMLHttpRequest();
    let status;

    request.onreadystatechange = function() {
        if (request.readyState == XMLHttpRequest.DONE ) {

            console.log(request.status)

            status = request.status
            responseStatus = status

            if (status >= 200 && status <= 299){
                console.log("STATUS:", status)
                responseStatusColor = "green"
                print(request.responseText)
                getPets()
                swiper.currentIndex = swiper.currentIndex
            }

            if (status >= 400 && status <= 499){
                console.log("STATUS:", status)
                responseStatusColor = "yellow"
                print(request.responseText)
            }

            if (status >= 500 && status <= 599){
                console.log("STATUS:", status)
                responseStatusColor = "red"
                print(request.responseText)
            }
        }
    }

    const url = swagger + "pet/" + id
    print(url)
    request.open("DELETE", url, true)

    request.send()

}

//////////////////////////////////////////////////
function getData(url) {
    //var url = url; // Идентификатор ресурса
    print(url)

    // 1. Создать XMLHttpRequest.
    let xmlhttp = new XMLHttpRequest();

    //xmlhttp.setRequestHeader("api-key","test");

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE ) {
            if(xmlhttp.status == 200){
                print("/////////////////////////////")
                //print(xmlhttp.responseText)
                print("/////////////////////////////")
                parseStaff(xmlhttp.responseText);
            }
            else {
                print("NOT_200!")
                print(xmlhttp.responseText)
                print("/////////////////////////////")
            }
            //status = xmlhttp.status
        }
    }

    // 2. Инициализировать его.
    xmlhttp.open("GET", url, true);

    // 3. Послать запрос
    xmlhttp.send();

    // 4. Слушать события на xmlhttp, чтобы получить ответ.
    //    xmlhttp.onload = function() {
    //      alert(`Загружено: ${xmlhttp.status} ${xmlhttp.response}`);
    //    };

    //    xhr.onerror = function() { // происходит, только когда запрос совсем не получилось выполнить
    //      alert(`Ошибка соединения`);
    //    };

    //    xmlhttp.onprogress = function(event) { // запускается периодически
    //      // event.loaded - количество загруженных байт
    //      // event.lengthComputable = равно true, если сервер присылает заголовок Content-Length
    //      // event.total - количество байт всего (только если lengthComputable равно true)
    //      alert(`Загружено ${event.loaded} из ${event.total}`);
    //    };
}


// Парсинг JSON ответа от сервера и запись значений в ListView
function parseStaff(response) {
    let jsonArr = []
    jsonArr = JSON.parse(response);

    //    jsonArr.forEach(element => {
    //         listModel.append({
    //                          "name:": element.name,
    //                          "id:": element.id,
    //                          "status:": element.status,
    //                          "photoUrl": element.photoUrls[0]
    //                          })
    //                        console.log("element:")
    //                        console.log(element)
    //                        console.log("name:", element.name)
    //                        console.log("id:", element.id)
    //                        console.log("status:", element.status)
    //                        console.log(element.category.id)
    //console.log(element.photoUrls[0])
    //                        {
    //                          "id": 0,
    //                          "category": {
    //                            "id": 0,
    //                            "name": "string"
    //                          },
    //                          "name": "doggie",
    //                          "photoUrls": [
    //                            "string"
    //                          ],
    //                          "tags": [
    //                            {
    //                              "id": 0,
    //                              "name": "string"
    //                            }
    //                          ],
    //                          "status": "available"
    //                        }
    //                  })

    //    var pet = jsonObj.pet
    //     print(pet)
    //    for(var i = 0; i < jsonObj.length; i++) {
    //        print(pet[i])
    //        //listview.model.append( {listdata: jsonStaff[i].name +" "+ jsonStaff[i].age + " " + jsonStaff[i].position})
    //    }

    //print(jsonObj)
}


