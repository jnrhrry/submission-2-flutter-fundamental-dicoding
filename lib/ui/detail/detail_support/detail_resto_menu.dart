import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission2/data/provider/resto_detail_provider.dart';
import 'package:submission2/ui/detail/detail_support/detail_menu_item.dart';

class RestoMenu extends StatelessWidget {
  final String title;
  const RestoMenu({@required this.title});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RestoDetailProvider>(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MenuItem(index: index, type: title);
                  },
                  itemCount: title == "Makanan" ?
                  state.result.restaurant.menus.foods.length :
                  state.result.restaurant.menus.drinks.length,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
