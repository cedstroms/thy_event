import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/models/feed_item.dart';
import 'package:thyevent/widgets/feed_card.dart';

class FeedList extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  List<FeedItem> feed = [
    FeedItem(
      logo: Icon(Icons.phone, size: 40),
      author: 'Ericsson',
      date: '1h',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam gravida quis urna id hendrerit. Praesent dolor libero, bibendum vitae convallis id, accumsan vel nulla. Vestibulum nec diam vulputate nunc elementum suscipit sit amet nec sapien. Ut ut eros magna. Morbi ut magna quis enim dictum mollis.',
    ),
    FeedItem(
      logo: Icon(Icons.build, size: 40),
      author: 'SKF',
      date: '2d',
      content: 'Sed eros mauris, aliquet eget viverra a, pellentesque id nibh. Nulla velit urna, congue sit amet velit ac, ultrices semper neque.',
    ),
    FeedItem(
      logo: Icon(Icons.power, size: 40),
      author: 'SBAB',
      date: '1w',
      content: 'Donec semper ligula eu leo imperdiet, vel aliquet lorem iaculis. Nam fermentum, felis et consequat commodo, turpis sem varius purus, ac suscipit eros tellus interdum ligula. Morbi varius ut odio quis tincidunt.',
    ),
    FeedItem(
      logo: Icon(Icons.people, size: 40),
      author: 'H&M',
      date: '1w',
      content: 'Donec semper ligula eu leo imperdiet, vel aliquet lorem iaculis. Nam fermentum, felis et consequat commodo, turpis sem varius purus, ac suscipit eros tellus interdum ligula. Morbi varius ut odio quis tincidunt.',
    ),
    FeedItem(
      logo: Icon(Icons.monetization_on, size: 40),
      author: 'SEB',
      date: '1w',
      content: 'Donec semper ligula eu leo imperdiet, vel aliquet lorem iaculis. Nam fermentum, felis et consequat commodo, turpis sem varius purus, ac suscipit eros tellus interdum ligula. Morbi varius ut odio quis tincidunt.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: feed.length,
      itemBuilder: (context, index) {
        return FeedCard(
          cardLogo: feed[index].logo,
          cardTitle: feed[index].author,
          cardDate: feed[index].date,
          cardContent: feed[index].content,
        );
      },
    );
  }
}
