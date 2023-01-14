import 'package:flutter/material.dart';
import './main.dart';
import './review.dart';

class DetailsForm extends StatelessWidget {
  final Reviews review;

  DetailsForm(this.review);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Close the screen and return "Yep!" as the result.
            Navigator.pop(context, 'Yep!');
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SizedBox(
          child: Card(
            child: Column(children: [
              ListTile(
                  leading: Icon(Icons.restaurant),
                  title: Text('Restaurant Name'),
                  subtitle: Text(review.restaurant_name)),
              ListTile(
                title: Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.all((Radius.circular(15)))),
                    child: Column(
                      children: [
                        Icon(
                          Icons.storefront,
                          size: 170,
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text('Restaurant Image')),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Reviewed By: '),
                  subtitle: Text(review.reviewer_name)),
              ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Rating'),
                  subtitle: Row(children: [
                    Text(review.rating.toString()),
                    Text(' out of 5 stars')
                  ])),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                  leading: Icon(Icons.speaker_notes),
                  title: Text('Notes'),
                  subtitle: Text(review.notes)),
            ]),
          ),
        ),
      ),
    );
  }
}
