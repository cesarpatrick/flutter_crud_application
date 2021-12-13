import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'editdatawidget.dart';
import 'model/cases.dart';

class DetailWidget extends StatefulWidget {
  final Cases cases;

  // ignore: use_key_in_widget_constructors
  const DetailWidget(this.cases);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
              child: Container(
            padding: const EdgeInsets.all(10.0),
            width: 440,
            child: Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text('Name:',
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    Text(widget.cases.name!,
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text('Gender:',
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    Text(widget.cases.gender!,
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text('Age:',
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    Text(widget.cases.age.toString(),
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text('Address:',
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    Text(widget.cases.address!,
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text('City:',
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    Text(widget.cases.city!,
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text('Country:',
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    Text(widget.cases.country!,
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text('Status:',
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    Text(widget.cases.status!,
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text('Update Date:',
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    if (widget.cases.updated != null)
                      Text(widget.cases.updated!,
                          style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    RaisedButton(
                      splashColor: Colors.red,
                      onPressed: () {
                        _navigateToEditScreen(context, widget.cases);
                      },
                      child: const Text('Edit',
                          style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      splashColor: Colors.red,
                      onPressed: () {
                        _confirmDialog();
                      },
                      child: const Text('Delete',
                          style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                    )
                  ],
                ),
              )
            ]),
          )),
        ),
      ),
    );
  }

  _navigateToEditScreen(BuildContext context, Cases cases) async {
    // ignore: unused_local_variable
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDataWidget(cases)),
    );
  }

  Future<void> _confirmDialog() async {
    final ApiService api = ApiService();

    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Are you sure want delete this item?')
                ],
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: const Text('Yes'),
                onPressed: () {
                  api.deleteCase(widget.cases.id!);
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
              ),
              // ignore: deprecated_member_use
              FlatButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
