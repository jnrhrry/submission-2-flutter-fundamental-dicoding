import 'package:flutter/material.dart';
import 'package:submission2/data/api/api_service.dart';
import 'package:submission2/data/model/resto_model.dart';
import 'package:submission2/ui/detail/detail.dart';

class RestoItem extends StatelessWidget {
  final Restaurant restaurant;
  const RestoItem({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, DetailPage.routeName,
          arguments: restaurant.id),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.pink[200],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    ApiService.smallImage + restaurant.pictureId
                  ))
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(restaurant.name, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Icon(
                        Icons.location_city,
                        color: Colors.pinkAccent,
                      ),
                      SizedBox(width: 5,),
                      Text(restaurant.city)
                    ],
                  ),
                  Row(children: [
                    Icon(Icons.stars, color: Colors.yellow[600],),
                    SizedBox(width: 5,),
                    Text(restaurant.rating.toString())
                  ],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
