import 'package:flutter/material.dart';

import '../app_screens/route.dart';
import 'additional_menus.dart';
import 'main_screen_widgets/all_menu_options.dart';

//

class MainScreenManager extends StatelessWidget {
  const MainScreenManager({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(createRouteHorizontalSlide(const AdditionalMenuManager()));
          },
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: const FittedBox(
            child: Text(
          "Butt committee",
          style: TextStyle(fontWeight: FontWeight.w500),
        )),
        toolbarHeight: 80,
        //leadingWidth: 70,
        actions: const [
          Icon(Icons.account_circle_outlined),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Center(
        child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              //

              SizedBox(
                height: 20,
              ),

              // row 1

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: BuildingManagementOption(),
                      )),
                  Spacer(),
                  Flexible(
                      flex: 5, child: FittedBox(child: CollectionOption())),
                  Spacer(),
                  Flexible(
                      flex: 5, child: FittedBox(child: InvoiceTableOption())),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //

              SizedBox(
                height: 10,
              ),

              // row 2

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: AccountStatusOption(),
                      )),
                  Spacer(),
                  Flexible(flex: 5, child: FittedBox(child: PaymentsOption())),
                  Spacer(),
                  Flexible(
                      flex: 5, child: FittedBox(child: ServiceCallOption())),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //

              SizedBox(
                height: 10,
              ),

              // row 3

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: TenantRoomOption(),
                      )),
                  Spacer(),
                  Flexible(
                      flex: 5, child: FittedBox(child: ProfessionalsOption())),
                  Spacer(),
                  Flexible(
                      flex: 5,
                      child: FittedBox(child: BuildingMaintenanceOption())),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //

              SizedBox(
                height: 10,
              ),

              // row 4

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(flex: 5, child: FittedBox(child: ForumOption())),
                  Spacer(),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                          child: SizedBox(
                        width: 100,
                        height: 150,
                      ))),
                  Spacer(),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: DiscussionOption(),
                      )),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //
              //
            ]),
      ),
    );
  }
}

//

class MainScreenManagementCompany extends StatelessWidget {
  const MainScreenManagementCompany({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(createRouteHorizontalSlide(const AdditionalMenuManager()));
          },
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: const Text(
          "Butt committee",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        toolbarHeight: 80,
        //leadingWidth: 70,
        actions: const [
          Icon(Icons.account_circle_outlined),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: const Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //

              SizedBox(
                height: 10,
              ),

              // row 1

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: BuildingManagementOption(),
                      )),
                  Spacer(),
                  Flexible(
                      flex: 5, child: FittedBox(child: CollectionOption())),
                  Spacer(),
                  Flexible(
                      flex: 5,
                      child: FittedBox(child: BuildingMaintenanceOption())),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //

              SizedBox(
                height: 10,
              ),

              // row 2

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: ServiceCallOption(),
                      )),
                  Spacer(),
                  Flexible(
                      flex: 5, child: FittedBox(child: ManagementFeeOption())),
                  Spacer(),
                  Flexible(
                      flex: 5, child: FittedBox(child: ProfessionalsOption())),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //

              SizedBox(
                height: 10,
              ),

              // row 3

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: DiscussionOption(),
                      )),
                  Spacer(),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                          child: SizedBox(
                        height: 150,
                        width: 100,
                      ))),
                  Spacer(),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                          child: SizedBox(
                        height: 150,
                        width: 100,
                      ))),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //
              //
            ]),
      ),
    );
  }
}

//

class MainScreenTenant extends StatelessWidget {
  const MainScreenTenant({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(createRouteHorizontalSlide(const AdditionalTenant()));
          },
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: const Text(
          "Butt committee",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        toolbarHeight: 80,
        //leadingWidth: 70,
        actions: const [
          Icon(Icons.account_circle_outlined),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: const Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //

              SizedBox(
                height: 10,
              ),

              // row 1

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: AccountStatusOption(),
                      )),
                  Spacer(),
                  Flexible(flex: 5, child: FittedBox(child: PaymentsOption())),
                  Spacer(),
                  Flexible(
                      flex: 5, child: FittedBox(child: ServiceCallOption())),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //

              SizedBox(
                height: 10,
              ),

              // row 2

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: TenantRoomOption(),
                      )),
                  Spacer(),
                  Flexible(
                      flex: 5, child: FittedBox(child: ProfessionalsOption())),
                  Spacer(),
                  Flexible(
                      flex: 5,
                      child: FittedBox(child: BuildingMaintenanceOption())),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //

              SizedBox(
                height: 10,
              ),

              // row 3

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: ForumOption(),
                      )),
                  Spacer(),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                          child: SizedBox(
                        height: 150,
                        width: 100,
                      ))),
                  Spacer(),
                  Flexible(
                      flex: 5, child: FittedBox(child: DiscussionOption())),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //
              //
            ]),
      ),
    );
  }
}

//

class MainScreenWorker extends StatelessWidget {
  const MainScreenWorker({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(createRouteHorizontalSlide(const AdditionalWorker()));
          },
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: const Text(
          "Butt committee",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        toolbarHeight: 80,
        //leadingWidth: 70,
        actions: const [
          Icon(Icons.account_circle_outlined),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: const Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //

              SizedBox(
                height: 10,
              ),

              // row 1

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 5,
                      child: FittedBox(
                        child: ServiceCallOption(),
                      )),
                  Spacer(),
                  Flexible(flex: 5, child: FittedBox(child: HistoryOption())),
                  Spacer(),
                  Flexible(flex: 5, child: FittedBox(child: RevenuesOption())),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //

              SizedBox(
                height: 10,
              ),

              // row 2

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Flexible(flex: 17, child: FittedBox(child: JobBoardOption())),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),

              //
              //
            ]),
      ),
    );
  }
}
