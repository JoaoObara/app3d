import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../models/demanda.dart';
import '../provider/demandas.dart';

class DemandaForm extends StatefulWidget {
  const DemandaForm({Key? key}) : super(key: key);

  @override
  _DemandaFormState createState() => _DemandaFormState();
}

class _DemandaFormState extends State<DemandaForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User demanda) {
    if (demanda != null) {
      _formData['id'] = demanda.id!;
      _formData['nome'] = demanda.nome;
      _formData['descricao'] = demanda.descricao;
      _formData['inicio'] = demanda.inicio.toString();
      _formData['fim'] = demanda.fim.toString();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final demanda = ModalRoute.of(context)?.settings.arguments as User;
    _loadFormData(demanda);
  }

  DateTime inicio = DateTime.now();
  DateTime fim = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar demanda '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _formData['nome'],
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe um nome'),
                    Validatorless.min(3, 'Três caracteres ou mais')
                  ]),
                  onSaved: (value) => _formData['nome'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['descricao'],
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  onSaved: (value) => _formData['descricao'] = value!,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('${inicio.day}/${inicio.month}/${inicio.year}'),
                          ElevatedButton(
                            child: const Text("Data Inicial"),
                            onPressed: () async {
                              DateTime? startDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2021),
                                lastDate: DateTime(2091),
                              );
                              //Cancelar calendário
                              if (startDate == null) return;
                              //Selecionar data
                              setState(() => inicio = startDate);
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('${fim.day}/${fim.month}/${fim.year}'),
                          ElevatedButton(
                            child: const Text("Data Final"),
                            onPressed: () async {
                              DateTime? endDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2021),
                                lastDate: DateTime(2091),
                              );
                              //Cancelar calendário
                              if (endDate == null) return;
                              //Selecionar data
                              setState(() => fim = endDate);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Modelo'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Salvar",
        child: const Icon(Icons.save),
        onPressed: () {
          _formData['status'] = "Em aberto";
          final isValid = _form.currentState!.validate();

          if (isValid) {
            _form.currentState!.save();

            Provider.of<Demandas>(context, listen: false).put(
              User(
                id: _formData['id'],
                nome: _formData['nome']!,
                descricao: _formData['descricao']!,
                status: _formData['status']!,
                inicio: _formData['inicio']!,
                fim: _formData['fim']!,
              ),
            );

            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
