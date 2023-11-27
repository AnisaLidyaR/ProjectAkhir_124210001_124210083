import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double amount = 0;
  String selectedFromCurrency = 'IDR';
  String selectedToCurrency = 'IDR';
  Map<String, double> currencies = {
    'IDR': 1,
    'USD': 14000, // Kurs Rupiah ke Dolar
    'Baht': 470, // Kurs Rupiah ke Baht
  };

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedFromCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFromCurrency = newValue!;
                      convertCurrency();
                    });
                  },
                  items: currencies.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Icon(Icons.compare_arrows),
                DropdownButton<String>(
                  value: selectedToCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedToCurrency = newValue!;
                      convertCurrency();
                    });
                  },
                  items: currencies.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                convertCurrency();
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                convertCurrency();
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text('Result: $amount $selectedToCurrency'),
          ],
        ),
      ),
    );
  }

  void convertCurrency() {
    setState(() {
      double fromCurrencyValue = currencies[selectedFromCurrency] ?? 1;
      double toCurrencyValue = currencies[selectedToCurrency] ?? 1;
      double inputAmount = double.tryParse(inputController.text) ?? 0;
      amount = (inputAmount * fromCurrencyValue) / toCurrencyValue;
    });
  }
}
