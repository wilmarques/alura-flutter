import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/hamburger_menu.dart';
import '../models/client.dart';
import '../models/client_type.dart';
import '../models/client_types.dart';
import '../models/clients.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const HamburgerMenu(),
      body: Consumer<Clients>(
        builder: (context, consumer, child) {
          return ListView.builder(
            itemCount: consumer.clients.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                child: ListTile(
                  leading: Icon(consumer.clients[index].type.icon),
                  title: Text(
                      '${consumer.clients[index].name} (${consumer.clients[index].type.name})'),
                  iconColor: Colors.indigo,
                ),
                onDismissed: (direction) {
                  setState(() {
                    consumer.remove(consumer.clients[index]);
                  });
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          createType(context);
        },
        tooltip: 'Add Tipo',
        child: const Icon(Icons.add),
      ),
    );
  }

  void createType(context) {
    TextEditingController nomeInput = TextEditingController();
    TextEditingController emailInput = TextEditingController();

    ClientTypes clientTypes = Provider.of<ClientTypes>(context, listen: false);
    ClientType dropdownValue = clientTypes.types[0];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Cadastrar cliente'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: nomeInput,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        icon: Icon(Icons.account_box),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextFormField(
                      controller: emailInput,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return DropdownButton(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.indigo,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue as ClientType;
                          });
                        },
                        items: clientTypes.types.map((ClientType type) {
                          return DropdownMenuItem<ClientType>(
                            value: type,
                            child: Text(type.name),
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  child: const Text("Salvar"),
                  onPressed: () async {
                    Provider.of<Clients>(context, listen: false).add(
                      Client(
                        name: nomeInput.text,
                        email: emailInput.text,
                        type: dropdownValue,
                      ),
                    );
                    Navigator.pop(context);
                  }),
              TextButton(
                  child: const Text("Calcelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }
}
