import 'package:flutter/material.dart';
import 'package:haritham_noel/models/report.dart';

import 'package:provider/provider.dart';

import 'package:haritham_noel/notifiers/report_notifier.dart';

import '../../global.dart';

class ReportListPage extends StatefulWidget {
  @override
  _ReportListPageState createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReportNotifier>(context, listen: false).getReports();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Expanded(
            child: Consumer<ReportNotifier>(
              builder: (ctx, snapshot, _) {
                switch (snapshot.status) {
                  case Status.loading:
                    return ReportsList(
                      reports: [],
                    );
                    break;
                  case Status.done:
                    return ReportsList(
                      reports: snapshot.reports,
                    );
                    break;
                  default:
                    return ReportsList(
                      reports: [],
                    );
                }
              },
            ),
          )
        ]),
      ),
    );
  }
}

class ReportsList extends StatelessWidget {
  final Function onTap;
  final List<ReportModel> reports;
  final ScrollController scrollController;
  const ReportsList({
    Key key,
    this.scrollController,
    @required this.reports,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 4,
            child: ListView.builder(
              controller: scrollController,
              itemCount: reports.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    // Go to single Post
                  },
                  child: ReportContainer(
                    postId: reports[i].id,
                    location: reports[i].location,
                    state: reports[i].state,
                    district: reports[i].district,
                    type: reports[i].type,
                    description: reports[i].description,
                    image: reports[i].image,
                    user: reports[i].user,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ReportContainer extends StatelessWidget {
  final String state, district, type, description, user, postId;
  final ImageModel image;
  final LocationModel location;
  ReportContainer({
    Key key,
    @required this.location,
    @required this.state,
    @required this.district,
    @required this.type,
    @required this.description,
    @required this.image,
    @required this.user,
    @required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: const Text('Card title 1'),
            subtitle: Text(
              '$district, $state',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          )
        ],
      ),
    );
  }
}
