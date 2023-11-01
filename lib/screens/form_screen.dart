import 'package:alura_flutter/data/task_inherited.dart';
import 'package:flutter/material.dart';

import '../task.dart';

class FormScreen extends StatefulWidget {
  final BuildContext inheritedContext;

  const FormScreen({Key? key, required this.inheritedContext}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nameController = TextEditingController();
  final _difficultyController = TextEditingController();
  final _imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 500,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Insira o nome da tarefa';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nome',
                      labelText: 'Nome',
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _difficultyController,
                    validator: (value) {
                      if (value!.isEmpty || int.parse(value) > 5 || int.parse(value) < 1) {
                        return 'Insira uma dificuldade entre 1 e 5';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Dificuldade',
                      labelText: 'Dificuldade',
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.url,
                    controller: _imageController,
                    validator: (value) => value!.isEmpty ? 'Insira uma URL de imagem' : null,
                    // https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-mono-81x100.png
                    onChanged: (value) {
                      setState(() {});
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Imagem',
                      labelText: 'Imagem',
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.blue),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      _imageController.text,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/nophoto.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(_nameController.text);
                        print(_difficultyController.text);
                        print(_imageController.text);

                        TaskInherited.of(widget.inheritedContext)!.addTask(
                          Task(
                            _nameController.text,
                            _imageController.text,
                            int.parse(_difficultyController.text),
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Salvando nova tarefa'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar')),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
