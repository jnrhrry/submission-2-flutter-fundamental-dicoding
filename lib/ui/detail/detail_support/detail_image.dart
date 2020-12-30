import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission2/data/api/api_service.dart';
import 'package:submission2/data/provider/resto_detail_provider.dart';

class DetailImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RestoDetailProvider>(context);
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: state.result.restaurant.id, child: Image.network(
            ApiService.largeImage + state.result.restaurant.pictureId,
            fit: BoxFit.cover,
          )),
      ),
    );
  }
}