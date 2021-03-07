import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:haritham_noel/models/report_model.dart';
import 'package:haritham_noel/notifiers/report_notifier.dart';
import 'package:location/location.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewReportForm extends StatefulWidget {
  @override
  _NewReportFormState createState() => _NewReportFormState();
}

class _NewReportFormState extends State<NewReportForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  ReportModel _reportDetails = new ReportModel(); // new line
  LocationModel _locationDetails = new LocationModel();

  Address _fullAddress ;

  bool loading = false;

  // Location
  Future<LocationData> _getUserLocation;

  String dropdownValue = '1.ഖരമാലിന്യം വലിച്ചെറിയൽ';
  static const List<String> typeOptions = const [
    '1.ഖരമാലിന്യം വലിച്ചെറിയൽ',
    '2.ഖരമാലിന്യം കത്തിക്കൽ',
    '3.അശാസ്ത്രീയമായി സംസ്കരിക്കൽ',
    '4.ദ്രവമാലിന്യം അലക്ഷ്യമായി ഒഴുക്കിവിടൽ',
    '5.മലിനജല സംസ്കരണ സംവിധാനങ്ങളുടെ അഭാവം',
    '6.ഇറച്ചിമാലിന്യ സംസ്കരണം',
    '7.ശുചിത്വ സംവിധാനങ്ങളുടെ അഭാവം',
    '8.ഭക്ഷണപദാർത്ഥങ്ങളുമായി ബന്ധപ്പെട്ടവ'
  ];
  String description;

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _adminAreaController = TextEditingController();
  TextEditingController _subAdminAreaController = TextEditingController();
  TextEditingController _locationDetailsController = TextEditingController();
  TextEditingController _addressLineController = TextEditingController();

  // Image
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    //Location
    _getUserLocation = getUserLocation();
  }

  // Location

  Future<LocationData> getUserLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    final result = await location.getLocation();
    _locationDetails.coordinates = [result.latitude, result.longitude];
    _fullAddress = await getSetAddress(new Coordinates(result.latitude, result.longitude));
    return result;
  }

  getSetAddress(Coordinates coordinates) async {
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    _addressLineController.text = addresses.first.addressLine;
    _adminAreaController.text = addresses.first.adminArea;
    _subAdminAreaController.text = addresses.first.subAdminArea;
    return addresses.first;
  }

  // Image

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Report an Offence"),
        ),
        body: FutureBuilder<LocationData>(
          future: _getUserLocation,
          builder: (context, snapshot) {
            switch (snapshot.hasData) {
              case true:
                return Center(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GestureDetector(
                              onTap: getImage,
                              child: Container(
                                child: Center(
                                  child: _image == null
                                      ? Column(children: [
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Text("Take a photo of the offence"),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Icon(
                                            Icons.photo_camera,
                                            size: 50,
                                          )
                                        ])
                                      : Image.file(_image),
                                ),
                                height: 250.0,
                                decoration: BoxDecoration(
                                  // color: Colors.grey[400],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                enabled: false,
                                controller: _addressLineController,
                                style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.location_pin),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          width: 2)),
                                  labelText: "Location",
                                  alignLabelWithHint: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                onSaved: (val) =>
                                    _locationDetails.description = val,
                                controller: _locationDetailsController,
                                style: Theme.of(context).textTheme.bodyText2,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  // icon: Icon(Icons.my_location),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          width: 2)),
                                  labelText: "Location Details",
                                  hintText:
                                      'Provide more details regarding the place',
                                  alignLabelWithHint: true,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: TextFormField(
                                onSaved: (val) => _reportDetails.district = val,
                                enabled: false,
                                controller: _subAdminAreaController,
                                style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                  // icon: Icon(Icons.location_pin),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          width: 2)),
                                  labelText: "District",
                                  alignLabelWithHint: true,
                                ),
                              ),
                            ),
                            //    Padding(
                            //      padding: const EdgeInsets.symmetric(vertical: 8),
                            //     child: TextFormField(
                            //       enabled: false,
                            //       controller: _adminAreaController,
                            //      style: Theme.of(context).textTheme.body1,
                            //     decoration: InputDecoration(
                            // icon: Icon(Icons.location),
                            //      enabledBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //             color:
                            //                 Theme.of(context).iconTheme.color,
                            //            width: 2)),
                            //     labelText: "State",
                            //    alignLabelWithHint: true,
                            //   ),
                            //   ),
                            //   ),
                            DropdownButtonFormField(
                              onSaved: (val) =>
                                  _reportDetails.type = val.toString(),
                              value: dropdownValue,
                              isExpanded: true,
                              items: typeOptions.map<DropdownMenuItem>(
                                (val) {
                                  return DropdownMenuItem(
                                    child: Text(val.toString()),
                                    value: val.toString(),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(() {
                                  dropdownValue = val.toString();
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Type of offence',
                                // icon: Icon(Icons.calendar_today),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                onSaved: (val) =>
                                    _reportDetails.description = val,
                                controller: _descriptionController,
                                style: Theme.of(context).textTheme.bodyText2,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  // icon: Icon(Icons.my_location),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          width: 2)),
                                  labelText: "Description",
                                  hintText: 'Description of offence',
                                  alignLabelWithHint: true,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                // Validate returns true if the form is valid, otherwise false.
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  _formKey.currentState.save();
                                  _locationDetails.type = 'Point';
                                  _reportDetails.location = _locationDetails;
                                  _reportDetails.state = _fullAddress.adminArea;
                                  await Provider.of<ReportNotifier>(context, listen: false).addReports(_reportDetails, _image.path);
                                  setState(() {
                                    loading = false;
                                  });
                                  // After the Selection Screen returns a result, hide any previous snackbars
                                  // and show the new result.
                                  ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(SnackBar(
                                        content: Text("Report Submitted")));
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.

                                }
                              },
                              child: loading
                                  ? Text('...')
                                  : Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              default:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ));
  }
}
