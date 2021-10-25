import 'package:dynamic_value/dynamic_value.dart';

class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});

  factory Quote.fromJSON(dynamic json) {

    final value = DynamicValue(json);

    return Quote(
      text: value['data'][0]['quoteText'].toString(),
      author: value['data'][0]['quoteAuthor'].toString(),
    );
  }

  @override
  String toString() {
    return 'Quote{ text: $text, author: $author }';
  }
}
