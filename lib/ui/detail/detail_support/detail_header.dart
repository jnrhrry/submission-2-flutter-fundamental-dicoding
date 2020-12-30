import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission2/data/provider/resto_detail_provider.dart';
import 'package:submission2/ui/detail/detail_support/detail_icon.dart';

class DetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RestoDetailProvider>(context);
    return Card(
      color: Colors.amber[100],
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.result.restaurant.name,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            DetailIcon(
                value: state.result.restaurant.city,
                icon: Icons.location_city,
                color: Colors.pinkAccent),
            DetailIcon(
                value: state.result.restaurant.rating.toString(),
                icon: Icons.stars,
                color: Colors.amber)
          ],
        ),
      ),
    );
  }
}
