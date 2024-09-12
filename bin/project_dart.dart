void main() {
    
    stamp();
    palindroma("ingegni");
    areaRettangolo(4 , 6);
    sommaProdotto(2, 2);
    media(6, 24);

    var persona1 = Persona("luca", "nero", "luca@gmail", "password1", "10-10-1800");
    var persona2 = Persona("marco", "rossi", "marco@gmail", "password2", "09-09-2000");

    print(persona1.nome);
    print(persona2.data);

    var arr = [6,3,1,2,9];
    calcolaMedia(arr);

    Docente docente1 = Docente('Mario', 'Rossi', 'D001', '45');
    Docente docente2 = Docente('Luisa', 'Bianchi', 'D002', '50');
    Studente studente1 = Studente('Anna', 'Verdi', 'S001', '20');
    Studente studente2 = Studente('Luca', 'Neri', 'S002', '22');

    // print(docente1.nome);
    // print(docente2.nome);
    // print(studente1.nome);
    // print(studente2.nome);

    Universita edificio1 = Universita();
    edificio1.docenti.add(docente1);
    edificio1.docenti.add(docente2);
    edificio1.studenti.add(studente1);
    edificio1.studenti.add(studente2);

    // print(edificio1.docenti);
    // print(edificio1.studenti);

    print(edificio1.mediaEtaStudenti());
    print(edificio1.mediaEtaDocenti());
    print(edificio1.cercaStudenteByCognome("Verdi"));
    print(edificio1.cercaStudenteByCognome("Gialli"));
    print(edificio1.cercaDocentiByCodice("D001"));
    print(edificio1.cercaDocentiByCodice("D004"));
}

// RICHIESTA 1

void stamp() {
    for (int i = 6; i > 0; i--) {
        print("*" * i);
    }
}

// RICHIESTA 2

void palindroma(String stringa) {
    var stringSplitted = stringa.split("");
    // print(stringSplitted);
    var stringReversed = stringSplitted.reversed;
    // print(stringReversed);
    var stringRight = stringReversed.join("");
    // print(stringRight);

    if (stringRight == stringa) {
        print("la parola è palindroma");
    } else {
        print("la parola non è palindroma");
    }
}

// RICHIESTA 3

void areaRettangolo(num base, num altezza) {
    print("l'area del rettangolo è ${base * altezza}");
}

// RICHIESTA 4

void sommaProdotto(int numA, int numB) {
    if (numA == numB) {
        int numC = (numA + numB) * 3;
        print(numC);
    } else {
        print(numA + numB);
    }
}

// RICHIESTA 5

///la funzione verifica anche che i voti siano nel range giusto
void media(num voto1, num voto2){
    num votoFinale = voto1 + voto2;
    //voto compreso tra -8 e 8
    if(voto1 <- 8 || voto1 > 8){
        print("errore , il voto è sbagliato");
        return;
    }
    //voto compreso tra 0 e 24
    if(voto2 < 0 || voto2 > 24){
        print("errore , il voto è sbagliato");
        return;
    }

    if(votoFinale>31){
        print("promosso con 30 e lode");
    }else if(votoFinale>=18){
        print("promosso con il voto di $votoFinale");
    }else{
        print("bocciato con il voto di $votoFinale");
    }
}

// RICHIESTA 6

class Persona {
    String nome;
    String cognome;
    String email;
    String password;
    String data;

    Persona(this.nome,this.cognome,this.email,this.password,this.data);
}

// RICHIESTA 7

/// la funzione verifica anche che nell'array ci siano elementi
void calcolaMedia(List<int> arr){
    if(arr.isEmpty){
        print("array vuoto");
        return;
    }

    int somma = arr.reduce((a,b)=>a+b);
    num media = somma/arr.length;
    print("la media è di $media");
}

// RICHIESTA 8

abstract class PersonaAbstract{
    String nome;
    String cognome;
    String codice;
    String eta;

    PersonaAbstract(this.nome, this.cognome, this.codice, this.eta);

    String getNome()=> nome;
    String getCognome()=> cognome;
    String getCodice()=> codice ;
    String getEta()=> eta;

    // @override
    // String toString(){
    //     return "Nome: $nome, Cognome: $cognome, Codice: $codice, Età: $eta";
    // }
}

class Docente extends PersonaAbstract{
    Docente(super.nome, super.cognome, super.codice, super.eta);

} 

class Studente extends PersonaAbstract{
    Studente(super.nome, super.cognome, super.codice, super.eta);
}

class Universita{
    List<Docente> docenti = [];
    List<Studente> studenti = [];

    dynamic cercaDocentiByCodice(String codice){
        var risultati = [];
        
        for(var docente in docenti){
            if(docente.getCodice() == codice){
                risultati.add(docente);
            }
        }
        if(risultati.isEmpty){
            return "il codice non corrisponde";
        }
        return risultati;
    }

    dynamic cercaDocentiByCognome(String cognome){
        List<Docente> risultati = [];

        for(var docente in docenti){
            if(docente.getCognome() == cognome){
                risultati.add(docente);
            }
        }
        if(risultati.isEmpty){
            return "il cognome non corrisponde";
        }
        return risultati;
    }

    dynamic cercaStudentiByCodice(String codice){
        List risultati =[];

        for(var studente in studenti){
            if(studente.getCodice() == codice){
                risultati.add(studente);
            }
        }
        if(risultati.isEmpty){
            return "il codice non corrisponde";
        }

        return risultati;

    }

    dynamic cercaStudenteByCognome(String cognome){
        List<Studente> risultati = [];

        for (var studente in studenti) {
            if(studente.getCognome()==cognome){
                risultati.add(studente);
            }
        }
        if(risultati.isEmpty){
            return "il cognome non corrisponde";
        }
        return risultati;
    }

    double mediaEtaStudenti(){
        if(studenti.isEmpty){
            return 0;
        }

        double somma = 0;
        for (var i = 0 ; i<studenti.length; i++){
            var test = studenti[i].getEta();
            double test2 = double.parse(test);
            somma += test2;
        }
        return somma / studenti.length;
    }

    double mediaEtaDocenti(){
        if(docenti.isEmpty){
            return 0;
        }

        double somma = 0;
        for (var i = 0 ; i<docenti.length; i++){
            double eta = double.parse(docenti[i].getEta());
            somma += eta;
        }
        return somma / docenti.length;
    }
}

