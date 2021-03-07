import 'package:flutter/material.dart';

import 'package:haritham_noel/models/report_model.dart';

import 'package:provider/provider.dart';

import 'package:haritham_noel/notifiers/report_notifier.dart';

import 'report_details.dart';

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
                    return Center(
                      child: CircularProgressIndicator(),
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
  final List<ReportModel> reports;
  final ScrollController scrollController;
  const ReportsList({
    Key key,
    this.scrollController,
    @required this.reports,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        controller: scrollController,
        itemCount: reports.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              // Go to single Post
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => ReportDetailPage(postId: reports[i].id)));
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
              created_at: reports[i].created_at,
            ),
          );
        },
      ),
    );
  }
}

class ReportContainer extends StatelessWidget {
  final String state, district, type, description, user, postId, created_at;
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
    @required this.created_at,
    @required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text("$district, $state"),
            subtitle: Text(created_at),
            trailing: Icon(Icons.keyboard_arrow_right, size: 30.0),
          ),
        ],
      ),
    );
  }
}
