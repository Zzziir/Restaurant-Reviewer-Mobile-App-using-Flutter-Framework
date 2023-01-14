import 'dart:async';
import './details.dart';
import 'package:flutter/material.dart';
import './review.dart';

void main() => runApp(mScreen());

List<Reviews> reviews_array = [];

List<String> litems = [];
final TextEditingController reviewer_name_controller =
    new TextEditingController();
final TextEditingController restaurant_name_controller =
    new TextEditingController();
final TextEditingController notes_controller = new TextEditingController();

class mScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DynamicList());
  }
}

class DynamicList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DynamicListState();
  }
}

class _DynamicListState extends State<DynamicList> {
  @override
  Widget build(BuildContext context) {
    FutureOr onGoBack(dynamic value) {
      setState(() {});
    }

    void navigateToReviewEntry() {
      Route route = MaterialPageRoute(builder: (context) => ReviewEntryForm());
      Navigator.push(context, route).then(onGoBack);
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Restaurant Reviews'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: navigateToReviewEntry,
            elevation: 8,
            child: Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                      itemCount: reviews_array.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 5,
                                    offset: Offset(5, 5))
                              ]),
                          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsForm(reviews_array[Index])));
                              },
                              leading: Icon(Icons.restaurant),
                              title: Text(reviews_array[Index].restaurant_name),
                              subtitle: Text(reviews_array[Index].notes,
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                              trailing: Wrap(children: [
                                Text(reviews_array[Index].rating.toString()),
                                Icon(Icons.star),
                              ])),
                        );
                        // return Text(litems[Index]);
                      }))
            ],
          )),
    );
  }
}
