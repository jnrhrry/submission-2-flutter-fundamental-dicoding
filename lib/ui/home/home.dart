import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission2/data/provider/resto_provider.dart';
import 'package:submission2/ui/home/home_support/resto_item.dart';
import 'package:submission2/ui/home/home_support/search.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homepage';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestoProvider>(
      create: (_) => RestoProvider(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Restaurant App 2',),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.search,),
                onPressed: () =>
                    Navigator.pushNamed(context, SearchPage.routeName))
          ],
        ),
        body: Consumer<RestoProvider>(builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.restaurants.length,
              itemBuilder: (context, index) {
                return RestoItem(
                  restaurant: state.result.restaurants[index],
                );
              },
            );
          } else if (state.state == ResultState.NoData) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultState.Error) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultState.NoConnection) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.message,
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
                  SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    onPressed: () => state.refresh(),
                    color: Colors.grey[200],
                    child: Text('Refresh'),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Text(''),
            );
          }
        }),
      ),
    );
  }
}
