import 'package:flutter/material.dart';
import './main.dart';

class Reviews {
  final String reviewer_name;
  final String restaurant_name;
  final int rating;
  final String notes;

  Reviews(this.reviewer_name, this.restaurant_name, this.rating, this.notes);
}

class ReviewEntryForm extends StatefulWidget {
  const ReviewEntryForm({super.key});

  @override
  State<ReviewEntryForm> createState() => ReviewEntryForm_State();
}

class ReviewEntryForm_State extends State<ReviewEntryForm> {
  // Initial Selected Value
  String dropdownvalue = 'Select Rating';

  // List of items in our dropdown menu
  var items = [
    'Select Rating',
    '★☆☆☆☆',
    '★★☆☆☆',
    '★★★☆☆',
    '★★★★☆',
    '★★★★★',
  ];

  @override
  Widget build(BuildContext context) {
    void submitReview(
        TextEditingController reviewer_name,
        TextEditingController restaurant_name,
        String dropdownValue,
        TextEditingController notes) {
      int ddValue = 0;
      switch (dropdownValue) {
        case '★☆☆☆☆':
          ddValue = 1;
          break;
        case '★★☆☆☆':
          ddValue = 2;
          break;
        case '★★★☆☆':
          ddValue = 3;
          break;
        case '★★★★☆':
          ddValue = 4;
          break;
        case '★★★★★':
          ddValue = 5;
          break;
        default:
          break;
      }

      setState(() {
        Reviews r = Reviews(
            reviewer_name.text, restaurant_name.text, ddValue, notes.text);
        reviews_array.add(r);
        reviewer_name_controller.clear();
        restaurant_name_controller.clear();
        notes_controller.clear();
      });
      Navigator.pop(context, 'Yep');
    }

    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Review Entry Form'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  // Close the screen and return "Yep!" as the result.
                  reviewer_name_controller.clear();
                  restaurant_name_controller.clear();
                  notes_controller.clear();
                  dropdownvalue = 'Select Rating';
                  Navigator.pop(context, 'Yep!');
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (reviewer_name_controller == null ||
                    restaurant_name_controller == null ||
                    dropdownvalue == 'Select Rating' ||
                    notes_controller == null) {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                              title: const Text('Missing Entries'),
                              content: const Text(
                                  'Please fill out the remaining details'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ]));
                } else {
                  submitReview(
                      reviewer_name_controller,
                      restaurant_name_controller,
                      dropdownvalue,
                      notes_controller);
                }
              },
              elevation: 8,
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 28,
              ),
            ),
            body: Column(
              children: <Widget>[
                //REVIEWER NAME TEXTFIELD
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: reviewer_name_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Reviewer Name',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                //RESTAURANT NAME TEXTFIELD
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: restaurant_name_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Restaurant Name',
                      hintText: 'Enter the Restaurant Name',
                    ),
                  ),
                ),
                //DROPDOWN BUTTON
                Card(
                  margin: EdgeInsets.all(15),
                  child: ListTile(
                    title: Text("Rating"),
                    leading: Icon(Icons.star),
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    trailing: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: false,
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            child: Text(items),
                            value: items,
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                //NOTES TEXTFIELD
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: 4,
                    controller: notes_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Notes',
                      hintText: 'Enter added remarks',
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ],
            )));
  }
}
