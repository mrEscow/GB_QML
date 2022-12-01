function getData(url) {
    print(url)
    //listview.model.clear()
    var xmlhttp = new XMLHttpRequest();
    //var url = url; // Идентификатор ресурса
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {
            print(xmlhttp.responseText)
            parseStaff(xmlhttp.responseText);
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
