import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
        ReportBody(report: report),
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
      child: 
    //   CachedNetworkImage(
    //     imageUrl: imageURL,
    //     progressIndicatorBuilder: (context, url, downloadProgress) => 
    //             CircularProgressIndicator(value: downloadProgress.progress),
    //     errorWidget: (context, url, error) => Icon(Icons.error),
    //  ),
      Image.network(
        imageURL,
        fit: BoxFit.cover,
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
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        // Default value for crossAxisAlignment is CrossAxisAlignment.center.
        // We want to align title and description of recipes left:
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            location.coordinates.toString(),
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
  }
}

class ReportBody extends StatelessWidget {

  final ReportModel report;

  ReportBody(this.report);

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}