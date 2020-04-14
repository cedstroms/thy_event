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
      logo: 'https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https:%2F%2Fwww.kindpng.com%2Fpicc%2Fm%2F371-3711608_ericsson-logo-telecommunications-three-diagonal-lines-logo-hd.png&sp=34587936c14dc303d6ba0f4dafe96107',
      author: 'Ericsson',
      date: '1h',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam gravida quis urna id hendrerit. Praesent dolor libero, bibendum vitae convallis id, accumsan vel nulla. Vestibulum nec diam vulputate nunc elementum suscipit sit amet nec sapien. Ut ut eros magna. Morbi ut magna quis enim dictum mollis.',
    ),
    FeedItem(
      logo: 'https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https:%2F%2Fwww.ekocentrum.se%2Fassets%2FSKF-Logo-S01__PBM-copy.jpg&sp=f223098c496f959526d7e448db93f03e',
      author: 'SKF',
      date: '2d',
      content: 'Sed eros mauris, aliquet eget viverra a, pellentesque id nibh. Nulla velit urna, congue sit amet velit ac, ultrices semper neque.',
    ),
    FeedItem(
      logo: 'https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https:%2F%2Fcached-images.bonnier.news%2Fswift%2Fbilder%2Fmedia%2Fcaebf3908a9a3748851da878290ebb85.jpg&sp=444a4e82c3ed3cab94a13b70f8daa234',
      author: 'SBAB',
      date: '1w',
      content: 'Donec semper ligula eu leo imperdiet, vel aliquet lorem iaculis. Nam fermentum, felis et consequat commodo, turpis sem varius purus, ac suscipit eros tellus interdum ligula. Morbi varius ut odio quis tincidunt.',
    ),
    FeedItem(
      logo: 'https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https:%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F5%2F53%2FH%2526M-Logo.svg%2F1200px-H%2526M-Logo.svg.png&sp=c35fa7c0885e5b7eab59137590148a99',
      author: 'H&M',
      date: '1w',
      content: 'Donec semper ligula eu leo imperdiet, vel aliquet lorem iaculis. Nam fermentum, felis et consequat commodo, turpis sem varius purus, ac suscipit eros tellus interdum ligula. Morbi varius ut odio quis tincidunt.',
    ),
    FeedItem(
      logo: 'https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https:%2F%2Fsebgroup.com%2Fglobalassets%2Fdownload-logotype%2Fseb_k_45mm150dpi.jpg&sp=6e233856e40a779eec9ab12da05f31de',
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
