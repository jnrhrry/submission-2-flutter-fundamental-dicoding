import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission2/data/provider/resto_detail_provider.dart';

class MenuItem extends StatelessWidget {
  final int index;
  final String type;
  const MenuItem({@required this.index, @required this.type});
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RestoDetailProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 100,
      decoration: BoxDecoration(color: Colors.pink[200]),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Center(
            child: Icon(
              Icons.fastfood,
              size: 80,
              color: Colors.white,
            ),
          ),
       Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              type == "Makanan"
                  ? state.result.restaurant.menus.foods[index].name
                  : state.result.restaurant.menus.drinks[index].name,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .apply(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
