import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyProfil extends StatefulWidget {
  const MyProfil({Key? key}) : super(key: key);

  @override
  _MyProfilState createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  String firstName = "Serge";
  String lastName = "Mounhami";
  int age = 32;
  double height = 184;
  bool genre = false;
  Map<String, bool> hobbies = {
    "Basket ": true,
    "Moto ": true,
    "Les Affaires ": false
  };
  List<String> language = ["React", "Flutter", "Dart"];
  String favL = "";
  String secret = "";
  bool showSecret = false;
  int groupValue = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profil"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(3),
          width: size.width,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.redAccent,
                width: size.width,
                child: Column(children: [
                  Text(
                    "$firstName $lastName",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Age: $age",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Taille: ${height.toInt()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    (genre) ? "Genre : Féminin" : "Genre : Masculin",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Hobbies : ",
                        style: TextStyle(color: Colors.white),
                      ),
                      hobbiesList(),
                    ],
                  ),
                  Text(
                    "Langage de programmation: $favL",
                    style: const TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showSecret = !showSecret;
                      });
                    },
                    child: const Text(
                      "Montrer Secret",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                  ),
                  (showSecret) ? Text(secret) : const Text("")
                ]),
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              const Text(
                "Modifier les infos",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: firstName, border: const OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                onChanged: (newFirstName) {
                  setState(() {
                    firstName = newFirstName;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: lastName, border: const OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                onChanged: (newlastName) {
                  setState(() {
                    lastName = newlastName;
                  });
                },
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Dites nous un secret",
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                onChanged: (newSecret) {
                  setState(() {
                    secret = newSecret;
                  });
                },
              ),
              Switch(
                  inactiveTrackColor: Colors.red,
                  inactiveThumbColor: Colors.redAccent,
                  activeColor: Colors.black,
                  value: genre,
                  onChanged: (bool) {
                    setState(() {
                      genre = bool;
                    });
                  }),
              Slider(
                  value: height,
                  min: 0,
                  max: 230,
                  thumbColor: Colors.purple,
                  activeColor: Colors.purpleAccent,
                  onChanged: (newValue) {
                    setState(() {
                      height = newValue;
                    });
                  }),
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              const Text(
                "Mes Hobbies",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              checks(),
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              const Text(
                "Langagues",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              radios()
            ],
          ),
        ),
      ),
    );
  }

  Row hobbiesList() {
    List<Widget> items = [];
    hobbies.forEach((hobbie, check) {
      Widget row = Row(children: [
        Text(
          hobbie,
          style: const TextStyle(color: Colors.white),
        )
      ]);
      (check) ? items.add(row) : null;
    });
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items);
  }

  Column checks() {
    List<Widget> items = [];
    hobbies.forEach((hobby, achete) {
      Widget row = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hobby),
          Checkbox(
              checkColor: Colors.red,
              activeColor: Colors.white,
              value: achete,
              onChanged: (newValue) {
                setState(() {
                  hobbies[hobby] = newValue ?? false;
                });
              })
        ],
      );
      items.add(row);
    });
    return Column(
      children: items,
    );
  }

  Row radios() {
    List<Widget> radios = [];
    for (var i = 0; i < language.length; i++) {
      Column r = Column(
        children: [
          Text(language[i]),
          Radio(
              value: i,
              groupValue: groupValue,
              onChanged: ((newValue) {
                setState(() {
                  groupValue = newValue as int;
                  favL = language[groupValue];
                });
              }))
        ],
      );
      radios.add(r);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: radios,
    );
  }
}
