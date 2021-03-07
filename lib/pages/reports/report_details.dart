import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:haritham_noel/global.dart';
import 'package:haritham_noel/models/report_model.dart';
import 'package:haritham_noel/notifiers/report_notifier.dart';
import 'package:provider/provider.dart';

class ReportDetailPage extends StatefulWidget {
  final postId;

  ReportDetailPage({Key key, this.postId}) : super(key: key);

  @override
  _ReportDetailPageState createState() => _ReportDetailPageState();
}

class _ReportDetailPageState extends State<ReportDetailPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReportNotifier>(context, listen: false)
        .getSingleReport(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<ReportNotifier>(
          builder: (ctx, snapshot, _) {
            switch (snapshot.status) {
              case Status.loading:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case Status.done:
                return ReportDetailsContainer(
                  report: snapshot.singleReport,
                );
                break;
              default:
                return ReportDetailsContainer(
                  report: null,
                );
            }
          },
        ),
      ),
    );
  }
}

class ReportDetailsContainer extends StatelessWidget {
  final ReportModel report;

  const ReportDetailsContainer({
    Key key,
    @required this.report,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReportImage(report.image.data),
        ReportTitle(report.location, report.created_at),
        ReportBody(report),
      ],
    );
  }
}

class ReportImage extends StatelessWidget {
  final String imageURL;

  ReportImage(this.imageURL);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Image.network(
        imageURL,
        fit: BoxFit.contain,
      ),
    );
  }
}

class ReportTitle extends StatelessWidget {
  final LocationModel location;
  final String date;

  ReportTitle(this.location, this.date);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Address>>(
        future: Geocoder.local.findAddressesFromCoordinates(
            new Coordinates(location.coordinates[0], location.coordinates[1])),
        builder: (context, snapshot) {
          switch (snapshot.hasData) {
            case true:
              return Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  // Default value for crossAxisAlignment is CrossAxisAlignment.center.
                  // We want to align title and description of recipes left:
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      snapshot.data.first.addressLine,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    // Empty space:
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.timer, size: 20.0),
                        SizedBox(width: 5.0),
                        Text(
                          date,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        });
  }
}

class ReportBody extends StatelessWidget {
  final ReportModel report;

  ReportBody(this.report);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(3),
            },
            children: [
              TableRow(children: [
                Text("State:"),
                Text(report.state),
              ]),
              TableRow(children: [
                Text("District:"),
                Text(report.district),
              ]),
              TableRow(children: [
                Text("Type:"),
                Text(report.type),
              ]),
              TableRow(children: [
                Text("Description:"),
                Text(report.description),
              ]),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.pending_actions),
          title: Text("Action Taken"),
        ),
      ],
    );
  }
}
