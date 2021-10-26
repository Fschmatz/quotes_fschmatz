import 'package:dynamic_value/dynamic_value.dart';

class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});

  factory Quote.fromJSON(dynamic json) {

    final value = DynamicValue(json);

    return Quote(
      text: value['content'].toString(),
      author: value['author'].toString(),
    );
  }

  @override
  String toString() {
    return 'Quote{ text: $text, author: $author }';
  }
}
