import 'package:app3d/models/demanda.dart';
import 'package:app3d/provider/demandas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';

class DemandaTile extends StatelessWidget {
  final Demanda demanda;

  // ignore: use_key_in_widget_constructors
  const DemandaTile(this.demanda);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return ListTile(
      title: Text(demanda.nome),
      subtitle: Text(demanda.descricao),
      trailing: SizedBox(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.demandaForm,
                arguments: demanda,
              );
            },
            icon: const Icon(Icons.edit),
            color: Colors.orange,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Excluir usuário'),
                  content: const Text('Tem certeza?'),
                  actions: <Widget>[
                    FlatButton(
                      child: const Text('Não'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    FlatButton(
                      child: const Text('Sim'),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
              ).then((confirmed) {
                if (confirmed) {
                  Provider.of<Demandas>(context, listen: false).remove(demanda);
                }
              });
            },
          )
        ]),
      ),
    );
  }
}
