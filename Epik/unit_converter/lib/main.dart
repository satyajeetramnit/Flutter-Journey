// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_field, unused_import, annotate_overrides, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _original;
  String? _Converted;
  double? _num;
  String? _result;

  void initState() {
    _num = 0.0;
    super.initState();
  }

  final List<String> _measurement = [
    'Centimeters',
    'Inches',
    'Pounds',
    'Kilograms',
  ];

  final Map<String, int> _measurementMap = {
    'Centimeters': 0,
    'Inches': 1,
    'Pounds': 2,
    'Kilograms': 3,
  };

  dynamic _formulas = {
    '0': [1, 0.393701, 0, 0],
    '1': [2.54, 1, 0, 0],
    '2': [0, 0, 1, 0.453592],
    '3': [0, 0, 2.20462, 1],
  };

  void convert(double value, String from, String to) {
    int? fromIndex = _measurementMap[from];
    int? toIndex = _measurementMap[to];
    var multiplier = _formulas[fromIndex.toString()][toIndex];
    var result = value * multiplier;
    if (result == 0) {
      setState(() {
        _result = 'Invalid Conversion';
      });
    } else {
      setState(() {
        _result =
            "${_num.toString()} $_original is ${result.toString()} $_Converted";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333333),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        'Unit Converter',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[300],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  // refresh icon
                  IconButton(
                    icon: Icon(Icons.refresh, color: Colors.white, size: 30),
                    onPressed: () {
                      setState(() {
                        _num = 0.0;
                        _original = null;
                        _Converted = null;
                        _result = null;
                      });
                    },
                  ),
                  // Spacer(),
                ],
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 70),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 51, 51, 51),
                              labelText: "Enter Value",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18.0,
                                color: Colors.grey[300],
                              )),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            var rv = double.tryParse(text);
                            if (rv != null) {
                              setState(() {
                                _num = rv;
                              });
                            }
                          },
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.9),
                                offset:
                                    Offset(5, 5), // changes position of shadow
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Color.fromARGB(255, 91, 90, 90),
                                offset: Offset(
                                    -4, -4), // changes position of shadow
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            dropdownColor: Colors.grey[800],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            hint: Center(
                                child: Text('Unit',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))),
                            items: _measurement
                                .map((String value) => DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _original = value.toString();
                              });
                            },
                            value: _original,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                          Spacer(),
                          DropdownButton(
                            dropdownColor: Colors.grey[800],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            hint: Center(
                                child: Text('Unit',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))),
                            items: _measurement
                                .map((String value) => DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _Converted = value.toString();
                              });
                            },
                            value: _Converted,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: ElevatedButton(
                          child: Text('Convert',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            if (_original!.isEmpty ||
                                _Converted!.isEmpty ||
                                _num == 0) {
                              return;
                            }
                            convert(_num!, _original!, _Converted!);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: Text(
                          _result ?? '',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
