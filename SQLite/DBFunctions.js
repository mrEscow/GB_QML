// DataBase functions

function createSimpleTable(tx) {

    const sql =
              'CREATE TABLE IF NOT EXISTS contacts (' +
              'contact_id INTEGER PRIMARY KEY,' +
              'first_name TEXT NOT NULL,' +
              'last_name TEXT NOT NULL,' +
              'email TEXT NOT NULL UNIQUE,' +
              'phone TEXT NOT NULL UNIQUE' +
              ');'

    tx.executeSql(sql)
}


function addContact(tx, first_name, last_name, email, phone) {

    const sql =
              'INSERT INTO contacts (first_name, last_name, email, phone)' +
              'VALUES("%1", "%2", "%3", "%4");'.arg(first_name).arg(last_name).arg(email).arg(phone)

    return tx.executeSql(sql)
}

function readContacts(tx, model) {

    const sql = 'SELECT contact_id, first_name, last_name, email, phone FROM contacts'

    let result = tx.executeSql(sql)

    for(let i = 0; i < result.rows.length; i++){
        model.appendRow({
                            id: result.rows.item(i).contact_id,
                            first_name: result.rows.item(i).first_name,
                            last_name: result.rows.item(i).last_name,
                            email: result.rows.item(i).email,
                            phone: result.rows.item(i).phone
                        })
    }
}
