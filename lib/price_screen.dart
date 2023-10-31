import 'dart:ffi';

import 'package:bitcoin_ticker_flutter/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  dynamic selectedCurrency = currenciesList[0];


  @override
  void initState() {
    super.initState();
  }

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropList = currenciesList
        .map(
          (c) =>
          DropdownMenuItem<String>(
            value: c,
            child: Text(c),
          ),
    ).toList();

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropList,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    List<Widget> children = currenciesList
        .map(
          (c) => Text(c),
    ).toList();

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: children,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 BTC = ? USD',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
    Container(
    height: 150.0,
    alignment: Alignment.center,
    padding: const EdgeInsets.only(bottom: 30.0),
    color: Colors.lightBlue,
    child: Platform.isIOS ? getCupertinoPicker() : getDropDownButton(),
    ),
    ],
    ),
    );
  }
}


