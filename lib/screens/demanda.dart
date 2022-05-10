import 'package:flutter/material.dart';

class ConsultarDemanda extends StatelessWidget {
  const ConsultarDemanda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demandas"),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: const [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
