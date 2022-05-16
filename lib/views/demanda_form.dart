import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void _loadFormData(Demanda demanda) {
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

    final demanda = ModalRoute.of(context)?.settings.arguments as Demanda;
    _loadFormData(demanda);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de demanda '),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();

                Provider.of<Demandas>(context, listen: false).put(
                  Demanda(
                    id: _formData['id'],
                    nome: _formData['nome']!,
                    descricao: _formData['descricao']!,
                    inicio: _formData['inicio']!,
                    fim: _formData['fim']!,
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'Url do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
