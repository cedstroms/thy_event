import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies_screen/models/companies_item.dart';
import 'package:thyevent/companies_screen/widgets/companies_card.dart';

class CompaniesList extends StatefulWidget {
  @override
  _CompaniesListState createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {
  List<CompaniesItem> companies = [
    CompaniesItem(
      logo: 'https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https:%2F%2Fwww.kindpng.com%2Fpicc%2Fm%2F371-3711608_ericsson-logo-telecommunications-three-diagonal-lines-logo-hd.png&sp=34587936c14dc303d6ba0f4dafe96107',
      company: 'Ericsson',
    ),
    CompaniesItem(
      logo: 'https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https:%2F%2Fwww.ekocentrum.se%2Fassets%2FSKF-Logo-S01__PBM-copy.jpg&sp=f223098c496f959526d7e448db93f03e',
      company: 'SKF',
    ),
    CompaniesItem(
      logo: 'https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https:%2F%2Fcached-images.bonnier.news%2Fswift%2Fbilder%2Fmedia%2Fcaebf3908a9a3748851da878290ebb85.jpg&sp=444a4e82c3ed3cab94a13b70f8daa234',
      company: 'SBAB',
    ),
    CompaniesItem(
      logo: 'https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https:%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F5%2F53%2FH%2526M-Logo.svg%2F1200px-H%2526M-Logo.svg.png&sp=c35fa7c0885e5b7eab59137590148a99',
      company: 'H&M',
    ),
    CompaniesItem(
      logo: 'https://s14-eu5.startpage.com/cgi-bin/serveimage?url=https:%2F%2Fsebgroup.com%2Fglobalassets%2Fdownload-logotype%2Fseb_k_45mm150dpi.jpg&sp=6e233856e40a779eec9ab12da05f31de',
      company: 'SEB',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: companies.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return CompaniesCard(
          cardLogo: companies[index].logo,
          cardTitle: companies[index].company,
        );
      },
    );
  }
}
