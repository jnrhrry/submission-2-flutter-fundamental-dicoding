import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission2/data/provider/resto_detail_provider.dart';

class DetailDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RestoDetailProvider>(context);
    return Card(
      color: Colors.pink[50],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overview'),
            SizedBox(
              height: 8,
            ),
            Text(state.result.restaurant.description, textAlign: TextAlign.justify)
          ],
        ),
      ),
    );
  }
}
