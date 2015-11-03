

function obrisiTabele(db){
	db.transaction(function(e){
		e.executeSql("DROP TABLE stamp");
	});
}

function napraviTabele(db){
	db.transaction(function(t){
		t.executeSql("CREATE TABLE IF NOT EXISTS stamp(idStamp INTEGER PRIMARY KEY, idCatalog INTEGER, stampDesription TEXT, nominalValue DOUBLE, value DOUBLE,  country TEXT, author TEXT, color TEXT, perforation TEXT, year INTEGER, circulation INTEGER, photo BLOB, status TEXT)",[], onError);
	});

}

function unosPodataka(db,idCatalog, stampDescription, nominalValue, value, country, author, color, perforation, year, circulation, photo, status, seria){
	db.transaction(function (e) {
                e.executeSql("INSERT INTO stamp(idCatalog, stampDesription, nominalValue, value, country, author, color, perforation, year, circulation, photo, status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)", [idCatalog, stampDescription, nominalValue, value, country, author, color, perforation, year, circulation, photo, status]);
            });
}
function onError(tx,error) {
    console.log("Error occurred: ", (error ? error.message  :""));
  }



