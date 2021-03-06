import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/demanda_tile.dart';
import '../models/demanda.dart';
import '../provider/demandas.dart';
import '../routes/app_routes.dart';

class DemandaList extends StatelessWidget {
  const DemandaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Demandas demandas = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar demandas'),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.add),
        //     onPressed: () {
        //       Navigator.of(context).pushNamed(
        //         AppRoutes.demandaForm,
        //         arguments: const Demanda(
        //           id: '',
        //           nome: '',
        //           descricao: '',
        //           inicio: '',
        //           fim: '',
        //         ),
        //       );
        //     },
        //   )
        // ],
      ),
      body: ListView.builder(
        itemCount: demandas.count,
        itemBuilder: (ctx, i) => DemandaTile(demandas.byIndex(i)),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.demandaForm,
              arguments: const Demanda(
                id: '',
                nome: '',
                descricao: '',
                status: '',
                inicio: '',
                fim: '',
              ),
            );
          }),
    );
  }
}
