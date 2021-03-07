import 'package:haritham_noel/global.dart';
import 'package:haritham_noel/models/report_model.dart';
import 'package:haritham_noel/services/ReportService.dart';
import 'package:flutter/material.dart';

class ReportNotifier extends ChangeNotifier {
  List<ReportModel> _reports = [];
  ReportModel _singleReport;
  Status _status;
  ReportService _api = ReportService();

  List<ReportModel> get reports => _reports;
  ReportModel get singleReport => _singleReport;
  Status get status => _status;

  getReports() async {
    _status = Status.loading;
    notifyListeners();
    _reports = await _api.getReports();
    _status = Status.done;
    notifyListeners();
  }

  getSingleReport(String id) async {
    _status = Status.loading;
    notifyListeners();
    _singleReport = await _api.getSingleReport(id);
    _status = Status.done;
    notifyListeners();
  }

  addReports(ReportModel reportDetails, String imagePath) async {
    await _api.addReport(reportDetails, imagePath);
  }
}
