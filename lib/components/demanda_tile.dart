import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/demanda.dart';
import '../provider/demandas.dart';
import '../routes/app_routes.dart';

class DemandaTile extends StatelessWidget {
  final User demanda;

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
            icon: const Icon(Icons.edit),
            color: Colors.orange,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.demandaForm,
                arguments: demanda,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Excluir demanda'),
                  content: const Text('Tem certeza?'),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('Não'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    ElevatedButton(
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
