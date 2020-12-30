import 'package:flutter/material.dart';
import 'package:submission2/ui/detail/detail_support/detail_description.dart';
import 'package:submission2/ui/detail/detail_support/detail_header.dart';
import 'package:submission2/ui/detail/detail_support/detail_resto_menu.dart';

class DetailAlignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          DetailHeader(),
          DetailDescription(),
          RestoMenu(title: 'Makanan'),
          RestoMenu(title: 'Minuman')
        ],
      ),
    );
  }
}