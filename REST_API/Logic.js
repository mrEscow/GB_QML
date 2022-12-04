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
        status = xmlhttp.status
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

    jsonArr.forEach(element => {
                        console.log("element:")
                        console.log(element)
                        console.log("name:", element.name)
                        console.log("id:", element.id)
                        console.log("status:", element.status)
                        console.log(element.category.id)
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
                    })

//    var pet = jsonObj.pet
//     print(pet)
//    for(var i = 0; i < jsonObj.length; i++) {
//        print(pet[i])
//        //listview.model.append( {listdata: jsonStaff[i].name +" "+ jsonStaff[i].age + " " + jsonStaff[i].position})
//    }

    //print(jsonObj)
}


