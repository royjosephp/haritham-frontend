import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
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
          title: Text("ഖരമാലിന്യം വലിച്ചെറിയൽ",
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
                leading: Icon(
                  Icons.arrow_right,
                  color: Colors.green,
                ),
                subtitle: Text(
                  "പൊതു, സ്വകാര്യ സ്ഥലങ്ങളിലേയ്ക്ക് വലിച്ചെറിയൽ",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.arrow_right,
                  color: Colors.green,
                ),
                subtitle: Text(
                    "വനപ്രദേശങ്ങൽ പോലെയുള്ള പാരിസ്ഥിതിക ദുർബല പ്രദേശങ്ങളിലേയ്ക്ക് വലിച്ചെറിയൽ",
                    style: TextStyle(
                      color: Colors.green,
                    )),
              ),
              ListTile(
                leading: Icon(
                  Icons.arrow_right,
                  color: Colors.green,
                ),
                subtitle: Text(
                    "നദികൾ, തോടുകൾ, കുളങ്ങൾ, കായലുകൾ തുടങ്ങിയ ജലാശയങ്ങളിലേയ്ക്കോ ജലസ്ത്രോതസ്സുകളിലേയ്ക്കോ വലിച്ചെറിയൽ",
                    style: TextStyle(
                      color: Colors.green,
                    )),
              ),
              ListTile(
                subtitle: Text(
                    "ജൈവമാലിന്യങ്ങൾ, പ്ലാസ്റ്റിക് ഉൾപ്പെടെയുള്ള അജൈവമാലിന്യങ്ങൾ, ഇലക്ട്രോണിക് മാലിന്യങ്ങൾ  (e-waste), ആശുപത്രി മാലിന്യങ്ങൾ, അപകടകരമായ മാലിന്യങ്ങൾ, കെട്ടിടങ്ങൾ പൊളിക്കുമ്പോഴുള്ള മാലിന്യങ്ങൾ തുടങ്ങി വ്യത്യസ്ത മാലിന്യങ്ങൾ ഇപ്രകാരം വിവിധസ്ഥലങ്ങളിൽ പരിസ്ഥിതിക്കും ആരോഗ്യത്തിനും ഹാനികരമാകുന്ന വിധത്തിൽ വലിച്ചെറിയപ്പെടാറുണ്ട്. തെരുവുനായ്ക്കളുടെ എണ്ണത്തിലുണ്ടാകുന്ന വർധന, പകർച്ചവ്യാധി വ്യാപനം, കടൽ/ജല ആവാസവ്യവസ്ഥകളുടെ തകർച്ച,  ഗുരുതരമായ രോഗങ്ങൾക്ക് വഴിവെക്കൽ തുടങ്ങി നിരവധി പ്രശ്നങ്ങൾ സൃഷ്ടിക്കുന്നതിനാൽ ഇത്തരം പ്രവർത്തികൾ കർശനമായി തടയേണ്ടതുണ്ട് ",
                    style: TextStyle(
                      color: Colors.grey[700],
                    )),
              ),
              ListTile(
                subtitle: Text(
                    "ഖരമാലിന്യങ്ങൾ തരം തിരിച്ച് സൂക്ഷിക്കുകയും തദ്ദേശ സ്വയംഭരണ സ്ഥാപനത്തിന്റെ നിർദ്ദേശാനുസരണം കയ്യൊഴിയുകയും ചെയ്തില്ലെങ്കിൽ ഖരമാലിന്യ പരിപാലന ചട്ടങ്ങളിലെ ചട്ടം 4(1), പരിസ്ഥിതി (സംരക്ഷണ) നിയമം 1988, വകുപ്പ് 15 എന്നിവ പ്രകാരം ശിക്ഷാർഹമാണ്.",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: MyHomeBottomNavBar1(),
      // BottomStackContainer(title: title, price: price),
    );
  }
}

class DetailsPage2 extends StatelessWidget {
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
          title: Text("ഖരമാലിന്യം കത്തിക്കൽ ",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
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
                color: Colors.green,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ]),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("പൊതുസ്ഥലങ്ങളിൽ കത്തിക്കൽ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("സ്വന്തം സ്ഥലത്തു കത്തിക്കൽ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഓഫീസുകളിലും സ്ഥാപനങ്ങളിലും കത്തിക്കൽ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "ജൈവ മാലിന്യങ്ങൾ, അജൈവ മാലിന്യങ്ങൾ, ആശുപത്രി മാലിന്യങ്ങൾ, അപകടകരമായ മാലിന്യങ്ങൾ എന്നിവ വെവ്വേറെയും കൂട്ടികലർത്തിയും ഇപ്രകാരം കത്തിക്കാറുണ്ട്. ഇവ കത്തിക്കുമ്പോഴുണ്ടാകുന്ന വിഷവാതകങ്ങൾ ഗുരുതരമായ ആരോഗ്യ പ്രശ്നങ്ങൾക്ക് കാരണമാകുന്നവയാണ്. കത്തുമ്പോഴുണ്ടാകുന്ന മിക്ക വാതകങ്ങളും ആഗോളതാപനത്തിന്റെ ആക്കം കൂട്ടുന്നവയുമാണ്. കരിയിലയും ചപ്പുചവറുകളും കൂട്ടിയിട്ടു കത്തിക്കുബോൾ അവയിൽ അപകടകരമായ ഖനലോഹങ്ങൾ ഉൾപ്പെടെ ഉൾപ്പെടാനും അതുവഴി ഗുരുതരമായ പാരിസ്ഥിക ആരോഗ്യ പ്രശ്നങ്ങൾ സൃഷ്ടിക്കാനും ഇടയുണ്ട്. ഇക്കാരണങ്ങളാൽ ഇത്തരം പ്രവൃത്തികൾ കർശനമായി തടയേണ്ടതുണ്ട് ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "ഖരമാലിന്യങ്ങള്‍ വലിച്ചെറിയുകയോ, കുഴിച്ചുമൂടുകയോ കത്തിക്കുകയോ ചെയ്യുന്നത് പരിസ്ഥിതി (സംരക്ഷണ) നിയമം 1986, വകുപ്പ് 15 പ്രകാരം ശിക്ഷാര്‍ഹമാണ്.",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      ),
     //  bottomNavigationBar: MyHomeBottomNavBar1(),
      // BottomStackContainer(title: title, price: price),
    );
  }
}

class DetailsPage3 extends StatelessWidget {
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
          title: Text("അശാസ്ത്രീയമായി സംസ്കരിക്കൽ",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
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
                color: Colors.green,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ]),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("വീടുകളിൽ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("സമ്മേളന ഹാളുകളിൽ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("സ്ഥാപനങ്ങളിൽ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഫ്ളാറ്റുകളിൽ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ആശുപത്രികളിൽ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "ജൈവ അജൈവ മാലിന്യങ്ങള്‍ അലക്ഷ്യമായി വലിച്ചെറിയുകയോ കത്തിക്കുകയോ ചെയ്യുന്നതുപോലെ അപകടകരമാണ് അശാസ്ത്രീയമായ രീതിയില്‍ അവയെ സംസ്കരിക്കുന്നതും. ഓരോ ഇനം മാലിന്യത്തിന്‍റെയും ശരിയായ സംസ്കരണ രീതികളെക്കുറിച്ചുളള അജ്ഞതകൊണ്ടും ശാസ്ത്രീയ മാലിന്യ സംസ്കരണ ത്തിനുള്ള ഉപാധികളുടെയും സൗകര്യങ്ങളുടെയും അഭാവം നിമിത്തവും ബോധപൂര്‍ വ്വമായും അശാസ്ത്രീയവും അപകടകരവുമായ മാലിന്യസംസ്കരണ രീതികള്‍ അനുവര്‍ത്തിക്കപ്പെടാറുണ്ട്. ഇവ പരിസ്ഥിതിക്കും മണ്ണിനും ജലത്തിനും അപകടകരമായതിനാല്‍ കര്‍ശനമായി തടയേണ്ടതുണ്ട്. മാലിന്യസംസ്കരണ ഉപാധികളെപ്പറ്റി അറിവില്ലാത്തവര്‍ക്കും സൗകര്യങ്ങള്‍ ലഭ്യമല്ലാത്തവര്‍ക്കും അത്തരം സൗകര്യങ്ങള്‍ ഒരുക്കുന്നതിന് തദ്ദേശസ്വയംഭരണ സ്ഥാപനങ്ങള്‍ മുന്‍കൈ എടുക്കേണ്ടതുമുണ്ട്. ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "വ്യാപാര കേന്ദ്രങ്ങള്‍, ആശുപത്രികള്‍ തുടങ്ങിയ സ്ഥലങ്ങളിലെ മാലിന്യങ്ങള്‍ ശരിയായി സംസ്കരിക്കാതിരിക്കുന്നത് കേരള പഞ്ചായത്ത് രാജ് ആക്ട് 1994, വകുപ്പ് 219 വി (1), കേരള മുനിസിപ്പല്‍ ആക്ട് 1994, വകുപ്പ് 334എ എന്നിവ പ്രകാരം ശിക്ഷാര്‍ഹമാണ്. ",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      ),
    //   bottomNavigationBar: MyHomeBottomNavBar1(),
      // BottomStackContainer(title: title, price: price),
    );
  }
}

class DetailsPage4 extends StatelessWidget {
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
          title: Text("ദ്രവമാലിന്യം അലക്ഷ്യമായും അപകടകരമായും ഒഴുക്കിവിടല്‍ ",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
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
                color: Colors.green,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ]),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("വീടുകളില്‍ നിന്നുള്ള ഗ്രേവാട്ടര്‍ ഒഴുക്കിവിടല്‍ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("വീടുകളില്‍ നിന്നുള്ള കക്കൂസ് മാലിന്യം ഒഴുക്കിവിടല്‍ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഫാക്ടറികളില്‍ നിന്നും വ്യവസായ സ്ഥാപനങ്ങളില്‍ നിന്നുമുള്ള മാലിന്യങ്ങള്‍ ഒഴുക്കി വിടല്‍ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഹോട്ടലുകള്‍, റസ്റ്റാറന്‍റുകള്‍ തുടങ്ങിയവ ഉള്‍പ്പെടെയുള്ള വ്യാപാര സ്ഥാപനങ്ങളില്‍ നിന്നുള്ള മാലിന്യങ്ങള്‍ ഒഴുക്കിവിടല്‍  ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ആശുപത്രി മാലിന്യങ്ങള്‍ ഒഴുക്കിവിടല്‍  ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഫ്ളാറ്റുകളില്‍ നിന്നുള്ള മാലിന്യങ്ങള്‍ ഒഴുക്കിവിടല്‍   ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "ജലാശയങ്ങളേയും ജലസ്രോതസ്സുകളേയും മലിനമാക്കുന്നതില്‍ ഏറ്റവും പ്രധാന പങ്കുവഹിക്കുന്നത് അവയിലേക്ക് ഒഴുക്കിവിടുന്ന ദ്രവമാലിന്യങ്ങളാണ്. കുടിവെള്ളം മലിനമാകല്‍, ജലജീവികളുടെ വംശനാശം തുടങ്ങി ഒട്ടേറെ പ്രശ്നങ്ങള്‍ ഇതുമൂലം ഉണ്ടാകുന്നതിനാല്‍ ഇത്തരം പ്രവൃത്തികള്‍ കര്‍ശനമായി തടയേണ്ടതുണ്ട്. ദ്രവമാലിന്യ സംസ്കരണ സംവിധാനങ്ങള്‍ സ്ഥാപിക്കുന്നതുള്‍പ്പെടെയുള്ള കാര്യങ്ങള്‍ ഇതുമായി ബന്ധപ്പെട്ട് തദ്ദേശഭരണ സ്ഥാപനങ്ങള്‍ പരിഗണിക്കേണ്ടിവരും.  ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "ജലസ്രോതസ്സുകളും ജലവിതരണ സംവിധാനങ്ങളും മലിനമാക്കുന്നത് കേരള പോലീസ് ആക്ട് 2010, വകുപ്പ് 120 ഇപ്രകാരം ശിക്ഷാര്‍ഹമായ കുറ്റമാണ്.  ",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      ),
     //  bottomNavigationBar: MyHomeBottomNavBar1(),
      // BottomStackContainer(title: title, price: price),
    );
  }
}

class DetailsPage5 extends StatelessWidget {
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
          title: Text("മലിനജല സംസ്കരണ സംവിധാനങ്ങളുടെ അഭാവം  ",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
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
                color: Colors.green,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ]),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ആശുപത്രികളില്‍ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഫാക്ടറികളിലും വ്യവസായ സ്ഥാപനങ്ങളിലും ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഹോട്ടലുകള്‍, റസ്റ്റോറന്‍റുകള്‍, മലിനജലം സൃഷ്ടിക്കുന്ന വ്യാപാരസ്ഥാപനങ്ങള്‍  ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഫ്ളാറ്റുകള്‍   ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("വീടുകള്‍   ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "ഓരോ ഇനം നിര്‍മ്മിതിയോടൊപ്പവും ഉറപ്പാക്കേണ്ട മലിനജല സംസ്കരണ സംവിധാനങ്ങള്‍ കെട്ടിട നിര്‍മ്മാണ ചട്ടങ്ങളില്‍ വ്യക്തമാക്കിയിട്ടുണ്ട്. ഇതിന് വിരു ദ്ധമായ നിര്‍മ്മിതികള്‍ നടത്തുന്നത് നിമിത്തമാണ് പലപ്പോഴും ജലസ്രോതസ്സുകളുടെ മലിനീകരണം ഉള്‍പ്പെടെയുള്ള പ്രശ്നങ്ങള്‍ ഉണ്ടാകുന്നത്. കെട്ടിടനിര്‍മ്മാണ ചട്ടങ്ങളിലെ നിബന്ധനകള്‍ കൃത്യമായി പാലിച്ചാല്‍ വലിയതോതില്‍ മലിനീകരണം തടയാന്‍ കഴിയും. ഇതിനായി നിയമലംഘകര്‍ക്കെതിരെ കര്‍ശന നടപടി സ്വീകരിക്കേണ്ടതുണ്ട്. ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "2500 ചതുരശ്ര മീറ്ററില്‍ കൂടുതല്‍ വിസ് തീര്‍ണ്ണമുള്ള റസിഡന്‍ഷ്യല്‍, ഓഫീസ്, വാണിജ്യ ഉപയോഗത്തില്‍പെട്ട കെട്ടിടങ്ങള്‍ക്കും മറ്റു ഗണത്തില്‍പെട്ട എല്ലാ കെട്ടിടങ്ങള്‍ക്കും ചട്ടം 55 (5 എ),56(8), 57 (12 എ), 58 (17), 59 (14), 60 (9), 61 (16) എന്നിവയും കേരള മുനിസിപ്പാ ലിറ്റി കെട്ടിട നിര്‍മ്മാണ ചട്ടങ്ങളിലെ ചട്ടം 53 (5), 54 (7), 55 (13), 56 (8), 57 (14), 58(7), 59 (15) എന്നിവയും പ്രകാരം ദ്രവമാലിന്യ സംസ്കരണ പ്ലാന്‍റ് ഒരുക്കിയിട്ടില്ലെങ്കില്‍ കേരള പഞ്ചായത്ത് കെട്ടിട നിര്‍മ്മാണ ചട്ടങ്ങ ളിലെ ചട്ടം 150, കേരള മുനിസിപ്പാലിറ്റി കെട്ടിട നിര്‍മ്മാണ ചട്ടങ്ങളിലെ ചട്ടം159 എന്നിവ പ്രകാരം ശിക്ഷാര്‍ഹമായ കുറ്റമാണ്. ",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      ),
     // bottomNavigationBar: MyHomeBottomNavBar1(),
      // BottomStackContainer(title: title, price: price),
    );
  }
}

class DetailsPage6 extends StatelessWidget {
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
          title: Text("ഇറച്ചി മാലിന്യം ",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
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
                color: Colors.green,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ]),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("സംസ്കരണ സംവിധാനങ്ങള്‍ ഒരുക്കാതിരിക്കല്‍ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("വലിച്ചെറിയല്‍ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "കേരളത്തിലെ പൊതുസ്ഥലങ്ങളുടേയും ജലസ്രോതസ്സുകളുടേയും മലിനീകരണത്തില്‍ വലിയ പങ്കുവഹിക്കുന്ന ഒരു ഇനമാണ് ഇറച്ചിമാലിന്യം. കശാപ്പുശാലകളിലും ചിക്കന്‍ കട്ടിംഗ് സെന്‍ററുകളിലും വ്യാപാരസ്ഥലങ്ങളിലും ശരിയായ മാലിന്യ സംസ്കരണ സംവിധാനം ഒരുക്കാത്തതാണ് ഈ പ്രശ്നത്തിനുകാരണം. മറ്റാവശ്യങ്ങള്‍ക്കായി ഇറച്ചി മാലിന്യം കൊണ്ടുപോകുമ്പോള്‍ പോലും അവയിലെ ഉപയോഗയോഗ്യമല്ലാത്ത ഭാഗങ്ങള്‍ റോഡിലോ ജലസ്രോതസ്സുകളിലോ വലിച്ചെറിയപ്പെടാറുണ്ട്. കുടിവെള്ള സ്രോതസ്സുകളുടെ വലിയ തോതിലുള്ള മലിനീകരണത്തിനും അതുവഴി ഗുരുതര ആരോഗ്യപ്രശ്നങ്ങള്‍ക്കും വഴിവെക്കുന്ന ഈ പ്രവൃത്തികള്‍ കര്‍ശനമായി തടയേണ്ടതുണ്ട്.   ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "ഇറച്ചി വ്യാപാരം നടത്തുന്ന കടകള്‍, പ്രാണികള്‍ കടക്കാതെ സുരക്ഷിതമല്ലാതയോ പൊതു ജനങ്ങള്‍ക്ക് അസ ഹ്യതയുണ്ടാക്കുംവിധമോ ലൈസന്‍സ് വിവരങ്ങള്‍ പ്രദര്‍ശിപ്പിക്കാതെയോ പ്രവര്‍ത്തിച്ചാല്‍ കേരള പഞ്ചായത്ത് രാജ് (കശാപ്പ്ശാലകളും ഇറച്ചിക്കടകളും) ചട്ടങ്ങളിലെ ചട്ടം 38, 41 എന്നിവ പ്രകാരം ശിക്ഷാര്‍ഹമായ കുറ്റമാണ്. ",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      ),
     // bottomNavigationBar: MyHomeBottomNavBar1(),
      // BottomStackContainer(title: title, price: price),
    );
  }
}

class DetailsPage7 extends StatelessWidget {
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
          title: Text("ശുചിത്വ സംവിധാനങ്ങളുടെ അഭാവം  ",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
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
                color: Colors.green,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ]),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("തൊഴിലിടങ്ങളില്‍ പണിയെടുക്കുന്ന ആള്‍ക്കാരുടെ എണ്ണത്തിന് ആവശ്യമായ ശുചിമുറികള്‍ നിര്‍മ്മിക്കാതിരിക്കല്‍  ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഓഫീസുകളില്‍ ജീവനക്കാരുടെ എണ്ണത്തിന് ആനുപാതികമായി ശുചിമുറികള്‍ ഒരുക്കാതിരിക്കല്‍ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("സ്കൂളുകളില്‍ കുട്ടികളുടെ എണ്ണത്തിന് ആനുപാതികമായി ശുചിമുറികള്‍ ഒരുക്കാതിരിക്കല്‍ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("തൊഴിലാളികളെ പാര്‍പ്പിച്ചിരിക്കുന്ന സ്ഥലങ്ങളില്‍ മതിയായ എണ്ണം ശുചിമുറികള്‍ ഒരുക്കാതിരിക്കല്‍ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഹോസ്റ്റലുകളില്‍ അന്തേവാസികളുടെ എണ്ണത്തിന് ആനുപാതികമായി ശുചിമുറികള്‍ ഒരുക്കാതിരിക്കല്‍ ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("സമ്മേളനാവശ്യങ്ങള്‍ക്കുള്ള സ്ഥലങ്ങളില്‍ ആവശ്യത്തിന് ശുചിമുറികള്‍ ഒരുക്കാതിരിക്കല്‍  ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "ആവശ്യമായ ശുചിമുറികള്‍ ഒരുക്കാതിരിക്കുന്നതും ശുചിമുറികള്‍ ശരിയായി പരിപാലിക്കാതിരിക്കുന്നതും വലിയ മാലിന്യ പ്രശ്നത്തിനും അതിലൂടെ ആരോഗ്യ പ്രശ്നത്തിനും വഴിയൊരുക്കാറുണ്ട്. കെട്ടിടനിര്‍മ്മാണ ചട്ടങ്ങളിലുള്‍പ്പെടെ ഇതു സംബന്ധിച്ച് നിലവിലുള്ള നിബന്ധനകള്‍ പാലിക്കാത്തതുകൊണ്ടാണ് ഇതു സംഭ വിക്കുന്നത്. ഇതുതടയുന്നതിനായി ഇതുമായി ബന്ധപ്പെട്ട നിയമങ്ങളും ചട്ടങ്ങളും കര്‍ശനമായി നടപ്പാക്കേണ്ടതുണ്ട്.  ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "അപായസാധ്യതയുള്ള ആവശ്യങ്ങള്‍ക്കുള്ള കെട്ടിടങ്ങള്‍, സമ്മേളന സ്ഥലങ്ങള്‍, ഹോട്ടലുകള്‍, വിദ്യാഭ്യാസ ആവശ്യങ്ങള്‍ക്കുള്ള കെട്ടിടങ്ങള്‍, ഓഫീസ്/കച്ചവട ആവശ്യങ്ങള്‍ക്കുള്ള കെട്ടിടങ്ങള്‍ വ്യാവസായിക ആവശ്യങ്ങള്‍ ക്കുള്ള കെട്ടിടങ്ങള്‍, ആശുപത്രികള്‍ എന്നീ വിഭാഗത്തില്‍പ്പെട്ട കെട്ടിടങ്ങള്‍ക്ക് നിശ്ചിത എണ്ണം ശുചിത്വ സംവിധാ നങ്ങള്‍ ഒരുക്കിയില്ലെങ്കില്‍ കേരള പഞ്ചായത്ത് കെട്ടിട നിര്‍മ്മാണ ചട്ടങ്ങ ളിലെ ചട്ടം 56, 61 (8) ചട്ടം 150, കേരള മുനിസിപ്പല്‍ കെട്ടിട നിര്‍മ്മാണ ചട്ടങ്ങളിലെ ചട്ടം 54(6), 59(7), 159 എന്നിവ പ്രകാരം ശിക്ഷാര്‍ഹമായ കുറ്റമാണ്.  ",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      ),
     // bottomNavigationBar: MyHomeBottomNavBar1(),
      // BottomStackContainer(title: title, price: price),
    );
  }
}

class DetailsPage8 extends StatelessWidget {
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
          title: Text("ഭക്ഷണപദാര്‍ത്ഥങ്ങളുമായി ബന്ധപ്പെട്ട മാലിന്യ പ്രശ്നങ്ങള്‍ ",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
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
                color: Colors.green,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ]),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("മലിനീകൃതമായ സാഹചര്യങ്ങളില്‍ നിര്‍മ്മിക്കുകയോ സൂക്ഷിക്കുകയോ വിതരണം ചെയ്യുകയോ കച്ചവടം നടത്തുകയോ ചെയ്യല്‍  ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("ഭക്ഷണപദാര്‍ത്ഥങ്ങളില്‍ ആരോഗ്യത്തിന് അപകടകരമായ വസ്തുക്കള്‍ ചേര്‍ക്കല്‍  ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                subtitle: Text("പഴകിയ ഭക്ഷണപദാര്‍ത്ഥങ്ങള്‍ സൂക്ഷിക്കലും വില്‍പ്പന നടത്തലും   ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "ഭക്ഷണ പദാര്‍ത്ഥങ്ങള്‍ നിര്‍മ്മിക്കുന്ന സ്ഥലവും കൈകാര്യംചെയ്യുന്ന സ്ഥലവും വില്‍പ്പന നടത്തുന്ന സ്ഥലവും മാലിന്യ മുക്തമായിരിക്കണം. ഇതിനു വിരു ദ്ധമായി നടക്കുന്നതു നിമിത്തം പലപ്പോഴും ഗുരുതരമായ ആരോഗ്യ പ്രശ്നങ്ങള്‍ ഉണ്ടാകാറുണ്ട്. ഭക്ഷണപദാര്‍ത്ഥങ്ങളില്‍ മായം കലര്‍ത്തുന്നതും പഴകിയ ഭക്ഷണസാ ധനങ്ങള്‍ വില്‍പ്പന നടത്തുന്നതും ഒരുതരത്തില്‍ മാലിന്യ പ്രശ്നങ്ങള്‍ തന്നെയാണ്. ഇവയും വലിയ ആരോഗ്യപ്രശ്നങ്ങള്‍ സൃഷ്ടിക്കുന്നവയാണ്. ഇത്തരം പ്രവൃത്തികള്‍ക്കെതിരെ കര്‍ശന നിയമനടപടികള്‍ സ്വീകരിക്കേണ്ടതുണ്ട്.  ",
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                subtitle: Text(
                    "ഭക്ഷണ പദാര്‍ത്ഥങ്ങള്‍ നിര്‍മ്മിക്കുകയോ കൈകാര്യം ചെയ്യുകയോ ചെയ്യുന്ന സ്ഥലങ്ങള്‍ വൃത്തിഹീനമാണെങ്കില്‍ ഭക്ഷ്യസുരക്ഷാ ഗുണനിലവാര നിയമം 2006, വകുപ്പ് 56 പ്രകരം ശിക്ഷാര്‍ഹമായ കുറ്റമാണ്. ",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      ),
     // bottomNavigationBar: MyHomeBottomNavBar1(),
      // BottomStackContainer(title: title, price: price),
    );
  }
}
