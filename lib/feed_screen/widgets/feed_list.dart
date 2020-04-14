import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/feed_screen/models/feed_item.dart';
import 'package:thyevent/feed_screen/widgets/feed_card.dart';

class FeedList extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  List<FeedItem> feed = [
    FeedItem(
      logo: 'assets/images/ericsson_logo.svg',
      author: 'Ericsson',
      date: '1h',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam gravida quis urna id hendrerit. Praesent dolor libero, bibendum vitae convallis id, accumsan vel nulla. Vestibulum nec diam vulputate nunc elementum suscipit sit amet nec sapien. Ut ut eros magna. Morbi ut magna quis enim dictum mollis.',
    ),
    FeedItem(
      logo: 'assets/images/skf_logo.svg',
      author: 'SKF',
      date: '2d',
      content: 'Sed eros mauris, aliquet eget viverra a, pellentesque id nibh. Nulla velit urna, congue sit amet velit ac, ultrices semper neque.',
    ),
    FeedItem(
      logo: 'assets/images/abb_logo.svg',
      author: 'ABB',
      date: '1w',
      content: 'Donec semper ligula eu leo imperdiet, vel aliquet lorem iaculis. Nam fermentum, felis et consequat commodo, turpis sem varius purus, ac suscipit eros tellus interdum ligula. Morbi varius ut odio quis tincidunt.',
    ),
    FeedItem(
      logo: 'assets/images/hm_logo.svg',
      author: 'H&M',
      date: '1w',
      content: 'Donec semper ligula eu leo imperdiet, vel aliquet lorem iaculis. Nam fermentum, felis et consequat commodo, turpis sem varius purus, ac suscipit eros tellus interdum ligula. Morbi varius ut odio quis tincidunt.',
    ),
    FeedItem(
      logo: 'assets/images/seb_logo.svg',
      author: 'SEB',
      date: '1w',
      content: 'Donec semper ligula eu leo imperdiet, vel aliquet lorem iaculis. Nam fermentum, felis et consequat commodo, turpis sem varius purus, ac suscipit eros tellus interdum ligula. Morbi varius ut odio quis tincidunt.',
    ),
    FeedItem(
      logo: 'assets/images/cisco_logo.svg',
      author: 'Cisco',
      date: '2w',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam gravida quis urna id hendrerit. Praesent dolor libero, bibendum vitae convallis id, accumsan vel nulla. Vestibulum nec diam vulputate nunc elementum suscipit sit amet nec sapien. Ut ut eros magna. Morbi ut magna quis enim dictum mollis.',
    ),
    FeedItem(
      logo: 'assets/images/ibm_logo.svg',
      author: 'IBM',
      date: '3w',
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
