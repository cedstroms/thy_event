import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompaniesInfoCardLinks extends StatefulWidget {
  final String header;
  final Map links;

  CompaniesInfoCardLinks({this.header, this.links});

  @override
  _CompaniesInfoCardLinksState createState() => _CompaniesInfoCardLinksState();
}

class _CompaniesInfoCardLinksState extends State<CompaniesInfoCardLinks> {
  Future<void> _launched;

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  linksFormatter(Map links) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: links.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemBuilder: (context, index) {
        String key = links.keys.elementAt(index);
        String value = links.values.elementAt(index);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: FaIcon(
                getIcon('$key'),
                size: 30,
                color: Theme.of(context).toggleableActiveColor,
              ),
              onPressed: () => setState(() {
                _launched = _launchURL('$value');
              }),
            ),
            Text(
              '$key'.toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }

  getIcon(String serviceType) {
    if (serviceType == 'facebook') {
      return FontAwesomeIcons.facebookSquare;
    }
    if (serviceType == 'website') {
      return FontAwesomeIcons.externalLinkSquareAlt;
    }
    if (serviceType == 'twitter') {
      return FontAwesomeIcons.twitterSquare;
    }
    if (serviceType == 'instagram') {
      return FontAwesomeIcons.instagramSquare;
    }
    if (serviceType == 'linkedin') {
      return FontAwesomeIcons.linkedin;
    }
    return FontAwesomeIcons.square;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          color: Theme.of(context).cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.header.toUpperCase(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.0,
                child: Divider(),
              ),
              linksFormatter(widget.links),
              FutureBuilder<void>(future: _launched, builder: _launchStatus),
            ],
          ),
        ),
      ],
    );
  }
}