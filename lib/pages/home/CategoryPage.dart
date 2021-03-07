import 'package:flutter/material.dart';
import 'package:haritham_noel/pages/reports/new_form.dart';
import 'DetailsPage.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.green[400],
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: ListTile(
          title: Text("ഹരിത നിയമ ലംഘനങ്ങൾ",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.green[100],
                spreadRadius: 10,
                blurRadius: 0,
              ),
            ]),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                title: Text("ഖരമാലിന്യം വലിച്ചെറിയൽ",
                    style: TextStyle(
                        color: Colors.grey[900], fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "പൊതു സ്ഥലങ്ങൾ, സ്വകാര്യ സ്ഥലങ്ങൾ, വനപ്രദേശങ്ങൾ, ജലാശയങ്ങൾ എന്നിവിടങ്ങളിൽ ഖരമാലിന്യം ഉപേക്ഷിക്കുന്നത്",
                    style: TextStyle(color: Colors.grey[700])),
                trailing: IconButton(
                    icon: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.green,
                )),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DetailsPage()));
                },
              ),
              showDivider(),
              ListTile(
                // leading: Image(
                // image: AssetImage("assets/images/solidwaste.png"),
                // width: 30,
                //   ),
                title: Text("ഖരമാലിന്യം കത്തിക്കൽ",
                    style: TextStyle(
                        color: Colors.grey[900], fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "സ്വന്തം സ്ഥലത്തോ, പൊതു സ്ഥലങ്ങളിലോ, ഓഫീസുകളിലോ മറ്റു സ്ഥാപനങ്ങളിലോ ഖരമാലിന്യം കത്തിക്കുന്നത്",
                    style: TextStyle(color: Colors.grey[700])),
                trailing: IconButton(
                    icon: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.green,
                )),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DetailsPage2()));
                },
              ),
              showDivider(),
              ListTile(
                // leading: Image(
                // image: AssetImage("assets/images/solidwaste.png"),
                // width: 30,
                //   ),
                title: Text("അശാസ്ത്രീയമായി സംസ്കരിക്കൽ",
                    style: TextStyle(
                        color: Colors.grey[900], fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "വീടുകൾ, സമ്മേളന ഹാളുകൾ, സ്ഥാപനങ്ങൾ, ഫ്ലാറ്റുകൾ, ആശുപത്രികൾ എന്നിവിടങ്ങളിൽ അശാസ്ത്രീയമായി ഖരമാലിന്യം സംസ്കരിക്കുന്നത്",
                    style: TextStyle(color: Colors.grey[700])),
                trailing: IconButton(
                    icon: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.green,
                )),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DetailsPage3()));
                },
              ),
              showDivider(),
              ListTile(
                // leading: Image(
                // image: AssetImage("assets/images/solidwaste.png"),
                // width: 30,
                //   ),
                title: Text("ദ്രവമാലിന്യം അലക്ഷ്യമായി ഒഴുക്കിവിടൽ",
                    style: TextStyle(
                        color: Colors.grey[900], fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "വീടുകൾ, ഫാക്ടറികൾ, വ്യാപാരസ്ഥാപനങ്ങൾ, ആശുപത്രികൾ എന്നിവിടങ്ങളിൽ നിന്ന് ദ്രവമാലിന്യം അലക്ഷ്യമായും അപകടകരമായും ഒഴുക്കി വിടുന്നത്",
                    style: TextStyle(color: Colors.grey[700])),
                trailing: IconButton(
                    icon: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.green,
                )),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DetailsPage4()));
                },
              ),
              showDivider(),
              ListTile(
                // leading: Image(
                // image: AssetImage("assets/images/solidwaste.png"),
                // width: 30,
                //   ),
                title: Text("മലിനജല സംസ്കരണ സംവിധാനങ്ങളുടെ അഭാവം",
                    style: TextStyle(
                        color: Colors.grey[900], fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "ആശുപത്രികൾ, വ്യാപാരസ്ഥാപനങ്ങൾ, ഫ്ലാറ്റുകൾ എന്നിവിടങ്ങളിൽ മലിനജല സംസ്കരണ സംവിധാനങ്ങൾ സ്ഥാപിക്കാതിരിക്കുന്നത്",
                    style: TextStyle(color: Colors.grey[700])),
                trailing: IconButton(
                    icon: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.green,
                )),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DetailsPage5()));
                },
              ),
              showDivider(),
              ListTile(
                // leading: Image(
                // image: AssetImage("assets/images/solidwaste.png"),
                // width: 30,
                //   ),
                title: Text("ഇറച്ചിമാലിന്യ സംസ്കരണം",
                    style: TextStyle(
                        color: Colors.grey[900], fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "ഇറച്ചിമാലിന്യ സംസ്കരണ സംവിധാനങ്ങൾ ഒരുക്കാതിരിക്കുന്നതും അവ പൊതുസ്ഥലങ്ങളിലും ജലസ്ത്രോതസ്സുകളിലും വലിച്ചെറിയുന്നതും",
                    style: TextStyle(color: Colors.grey[700])),
                trailing: IconButton(
                    icon: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.green,
                )),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DetailsPage6()));
                },
              ),
              showDivider(),
              ListTile(
                // leading: Image(
                // image: AssetImage("assets/images/solidwaste.png"),
                // width: 30,
                //   ),
                title: Text("ശുചിത്വ സംവിധാനങ്ങളുടെ അഭാവം",
                    style: TextStyle(
                        color: Colors.grey[900], fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "തൊഴിലിടങ്ങൾ, വിദ്യാഭ്യാസ സ്ഥാപനങ്ങൾ, സമ്മേളന സ്ഥലങ്ങൾ എന്നിവിടങ്ങളിൽ ആവശ്യമായ ശുചിമുറികൾ ഒരുക്കാതിരിക്കുന്നതും പരിപാലിക്കാതിരിക്കുന്നതും",
                    style: TextStyle(color: Colors.grey[700])),
                trailing: IconButton(
                    icon: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.green,
                )),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DetailsPage7()));
                },
              ),
              showDivider(),
              ListTile(
                // leading: Image(
                // image: AssetImage("assets/images/solidwaste.png"),
                // width: 30,
                //   ),
                title: Text("ഭക്ഷണപദാർത്ഥങ്ങളുമായി ബന്ധപ്പെട്ടവ",
                    style: TextStyle(
                        color: Colors.grey[900], fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "മലിനീകൃതമായ സാഹചര്യങ്ങളിൽ നിർമ്മിക്കുന്നതും ആരോഗ്യത്തിന് ഹാനികരമായ വസ്തുക്കൾ ചേർക്കുന്നതും പഴകിയ ഭക്ഷണം വിൽപ്പന നടത്തുന്നതും",
                    style: TextStyle(color: Colors.grey[700])),
                trailing: IconButton(
                    icon: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.green,
                )),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DetailsPage8()));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(blurRadius: 0, color: Colors.grey, spreadRadius: 0)
              ]),
          child: ListTile(
            title: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => NewReportForm()));
              },
              child: Text('നിയമ ലംഘനം റിപ്പോർട്ട് ചെയ്യുക'),
            ),
          ),
        ),
      ),
      // BottomStackContainer(title: title, price: price),
    );
  }
}

Divider showDivider() {
  return Divider(
    color: Colors.green,
    height: 10,
    thickness: 1,
    indent: 10,
    endIndent: 10,
  );
}
