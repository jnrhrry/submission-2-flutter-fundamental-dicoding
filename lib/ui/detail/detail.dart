import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission2/data/provider/resto_detail_provider.dart';
import 'package:submission2/ui/detail/detail_support/detail_alignment.dart';

import 'detail_support/detail_image.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail_restaurant';
  final String id;
  const DetailPage({@required this.id});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestoDetailProvider>(
      create: (_) => RestoDetailProvider(context, id: widget.id),
      child: Scaffold(
        body: Consumer<RestoDetailProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.state == ResultState.HasData) {
              return NestedScrollView(
                headerSliverBuilder: (context, isScrolled) {
                  return [
                    DetailImage(),
                  ];
                },
                body: DetailAlignment(),
              );
            } else if (state.state == ResultState.NoData) {
              return Center(child: Text(state.message));
            } else if (state.state == ResultState.Error) {
              return Center(child: Text(state.message));
            } else if (state.state == ResultState.NoConnection) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    SizedBox(height: 30),
                    RaisedButton(
                      onPressed: () => state.refresh(),
                      color: Colors.blue[200],
                      child: Text('Refresh'),
                    )
                  ],
                ),
              );
            } else {
              return Center(child: Text(''));
            }
          },
        ),
      ),
    );
  }
}
