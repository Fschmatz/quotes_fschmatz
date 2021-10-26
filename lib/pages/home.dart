import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:quotes_fschmatz/classes/quote.dart';
import 'configs/settings_page.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //https://github.com/lukePeavey/quotable ->  API page

  bool loading = true;
  String apiUrl = 'https://api.quotable.io/random';
  Quote quoteFromApi = Quote(author: '', text: '');
  TextStyle quoteStyle = const TextStyle(fontSize:22,fontWeight: FontWeight.w700);

  @override
  void initState() {
    getQuote();
    super.initState();
  }

  Future<void> getQuote() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Quote quoteResponse = Quote.fromJSON(jsonDecode(response.body));
      setState(() {
        loading = false;
        quoteFromApi = quoteResponse;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes Fschmatz'),
        actions: [
          IconButton(
              color: Theme.of(context)
                  .textTheme
                  .headline6!
                  .color!
                  .withOpacity(0.8),
              icon: const Icon(
                Icons.settings_outlined,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SettingsPage(),
                      fullscreenDialog: true,
                    ));
              }),
        ],
      ),
      body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: const Icon(Icons.format_quote_rounded))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(quoteFromApi.text + '\n\n'+quoteFromApi.author,
                      style: quoteStyle,
                    textAlign: TextAlign.center,),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                        child: Icon(Icons.format_quote_rounded)),
                  ),
                ],
              )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            loading = true;
          });
          getQuote();
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Icon(
          Icons.refresh_outlined,
          color: Theme.of(context).colorScheme.secondaryVariant,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
