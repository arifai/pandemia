import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

const List<String> Programmers = [
  "Robin (@anvie)",
  "Fatkhur",
  "Samsul",
  "Muiz",
  "Rifai"
];

class _AboutPageState extends State<AboutPage> {
  String version;

  @override
  void initState() {
    super.initState();
    getPackageInfo();
  }

  getPackageInfo() async {
    PackageInfo pInfo = await PackageInfo.fromPlatform();
    setState(() => version = pInfo.version);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _getBody(context),
          ],
        ),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    List<Widget> credits = [
      _sizedBox(context),
      Container(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/img/pandemia-logo.png",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          "Pandemia",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          "Version : $version",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      _sizedBox(context),
      _textDefault(
          "Adalah program sumber terbuka (open source) yang dikembangkan oleh komunitas " +
              "untuk memudahkan " +
              "kita dalam memantau persebaran wabah, sehingga kita dapat mengambil keputusan yang " +
              "lebih bijak dan terukur dalam melakukan kegiatan kesehariannya.",
          maxLines: 10,
          textAlign: TextAlign.center),
      Container(
        color: Colors.black,
        height: 1,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 8,
          right: MediaQuery.of(context).size.width / 8,
          top: MediaQuery.of(context).padding.top / 3,
          bottom: MediaQuery.of(context).padding.top,
        ),
      ),
      _row(
        label: "Kode sumber",
        midText: ":",
        value: "https://github.com/cesindo/pandemia",
      ),
      _row(
        label: "Data by",
        midText: ":",
        value: "www.kawalcorona.com",
      ),
      _row(
        label: " ",
        midText: " ",
        value: "www.worldmeters.info",
      ),
      _row(
        label: " ",
        midText: " ",
        value: "corona.jatengprov.go.id",
      ),
      SizedBox(
        height: MediaQuery.of(context).padding.top / 2,
      ),
      _row(
        label: "Server by",
        midText: ":",
        value: "Delameta",
      ),
      _divider(),
      _row(
        label: "Icon by",
        midText: ":",
        value: "photo3idea-studio",
      ),
      _row(
        label: "",
        midText: ":",
        value: "freeicons.io",
      ),
      _divider(),
    ];

    credits.add(Text("Kontributor:"));
    credits.add(_divider());
    Programmers.forEach((p) {
      credits.add(_textDefault(p));
    });

    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 10,
        right: MediaQuery.of(context).size.width / 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: credits,
      ),
    );
  }

  Widget _divider() {
    return SizedBox(
      height: MediaQuery.of(context).padding.top / 2,
    );
  }

  Widget _sizedBox(BuildContext parentcontext) {
    return SizedBox(
      height: MediaQuery.of(parentcontext).size.width / 10,
    );
  }

  Widget _textDefault(String text, {maxLines: 1, textAlign: TextAlign.left}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 16,
      ),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }

  _row({String label, String midText, String value}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            child: _textDefault(label),
          ),
          _textDefault(midText + "   "),
          Expanded(
            flex: 3,
            child: _textDefault(value),
          ),
        ],
      ),
    );
  }
}
