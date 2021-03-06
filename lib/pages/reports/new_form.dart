import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:image_picker/image_picker.dart';

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

  // Location
  Future<LocationData> _getUserLocation;
  double latitude;
  double longitude;
  String _resultAddress;
  String _countryName;
  String _postalCode;
  String _adminArea;
  String _subAdminArea;
  String _locality;
  String _subLocality;

  // Image
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
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
    latitude = result.latitude;
    longitude = result.longitude;
    return result;
  }

  getSetAddress(Coordinates coordinates) async {
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      _resultAddress = addresses.first.addressLine;
      _countryName = addresses.first.countryName;
      _postalCode = addresses.first.postalCode;
      _adminArea = addresses.first.adminArea;
      _subAdminArea = addresses.first.subAdminArea;
      _locality = addresses.first.locality;
      _subLocality = addresses.first.subLocality;
    });
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
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: getImage,
                child: Container(
                  child: Center(
                    child: _image == null
                        ? Column(children: [
                            Text("Take a photo of the offence"),
                            SizedBox(
                              height: 50,
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
                    color: Colors.grey[400],
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<LocationData>(
                  future: _getUserLocation,
                  builder: (context, snapshot) {
                    switch (snapshot.hasData) {
                      case true:
                        return Text('Location : $latitude ,  $longitude');
                      default:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _resultAddress ?? "Address will be shown here",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text("Get My Location Address"),
                  onPressed: () async {
                    if (latitude != null && longitude != null) {
                      getSetAddress(Coordinates(latitude, longitude));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
