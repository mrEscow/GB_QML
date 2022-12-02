function getData(url) {
    //var url = url; // Идентификатор ресурса
    print(url)

    // 1. Создать XMLHttpRequest.
    let xmlhttp = new XMLHttpRequest();

    xmlhttp.setRequestHeader("api-key","test");

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE ) {
            if(xmlhttp.status == 200){
                print("/////////////////////////////")
                print(xmlhttp.responseText)
                print("/////////////////////////////")
                parseStaff(xmlhttp.responseText);
            }
            else {
                print("NOT_200!")
                print(xmlhttp.responseText)
                print("/////////////////////////////")
            }

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
    var jsonObj = JSON.parse(response);

    //    var jsonStaff = jsonObj.staff
    //    for(var i = 0; i < jsonStaff.length; i++) {
    //        listview.model.append( {listdata: jsonStaff[i].name +" "+ jsonStaff[i].age + " " + jsonStaff[i].position})
    //    }

    print(jsonObj)
}
