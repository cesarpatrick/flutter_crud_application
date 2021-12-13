import 'package:flutter/material.dart';
import 'package:flutter_form_application/services/api_service.dart';
import 'model/cases.dart';

enum Gender { male, female }
enum Status { positive, dead, recovered }

class EditDataWidget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const EditDataWidget(this.cases);

  final Cases cases;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _nameController = TextEditingController();
  String gender = 'male';
  Gender _gender = Gender.male;
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  String status = 'positive';
  Status _status = Status.positive;

  @override
  void initState() {
    id = widget.cases.id!;
    _nameController.text = widget.cases.name!;
    gender = widget.cases.gender!;
    if (widget.cases.gender == 'male') {
      _gender = Gender.male;
    } else {
      _gender = Gender.female;
    }
    _ageController.text = widget.cases.age.toString();
    _addressController.text = widget.cases.address!;
    _cityController.text = widget.cases.city!;
    _countryController.text = widget.cases.country!;
    status = widget.cases.status!;
    if (widget.cases.status == 'positive') {
      _status = Status.positive;
    } else if (widget.cases.status == 'dead') {
      _status = Status.dead;
    } else {
      _status = Status.recovered;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Cases'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('Full Name'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Full Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter full name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('Gender'),
                              ListTile(
                                title: const Text('Male'),
                                leading: Radio(
                                  value: Gender.male,
                                  groupValue: _gender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _gender = value!;
                                      gender = 'male';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Female'),
                                leading: Radio(
                                  value: Gender.female,
                                  groupValue: _gender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _gender = value!;
                                      gender = 'female';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('Age'),
                              TextFormField(
                                controller: _ageController,
                                decoration: const InputDecoration(
                                  hintText: 'Age',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter age';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('Address'),
                              TextFormField(
                                controller: _addressController,
                                decoration: const InputDecoration(
                                  hintText: 'Address',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter address';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('City'),
                              TextFormField(
                                controller: _cityController,
                                decoration: const InputDecoration(
                                  hintText: 'City',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter city';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('Country'),
                              TextFormField(
                                controller: _countryController,
                                decoration: const InputDecoration(
                                  hintText: 'Country',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter country';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('Status'),
                              ListTile(
                                title: const Text('Positive'),
                                leading: Radio(
                                  value: Status.positive,
                                  groupValue: _status,
                                  onChanged: (Status? value) {
                                    setState(() {
                                      _status = value!;
                                      status = 'positive';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Dead'),
                                leading: Radio(
                                  value: Status.dead,
                                  groupValue: _status,
                                  onChanged: (Status? value) {
                                    setState(() {
                                      _status = value!;
                                      status = 'dead';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Recovered'),
                                leading: Radio(
                                  value: Status.recovered,
                                  groupValue: _status,
                                  onChanged: (Status? value) {
                                    setState(() {
                                      _status = value!;
                                      status = 'recovered';
                                    });
                                  },
                                ),
                              ),
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
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.updateCases(
                                        id,
                                        Cases(
                                            name: _nameController.text,
                                            gender: gender,
                                            status: status,
                                            age: _ageController.text,
                                            address: _addressController.text,
                                            city: _cityController.text,
                                            country: _countryController.text));

                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('Save',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
