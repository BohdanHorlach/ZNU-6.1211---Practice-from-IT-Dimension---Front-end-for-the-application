import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:znu_flutter_it_dimension/domain/user/user_data.dart';
import 'package:znu_flutter_it_dimension/presentation/main_menu/widgets/all_menu_options.dart';

import '../../domain/models/management_companies/committees_data.dart';
import 'additional_menu/additional_menu_4types.dart';
import 'additional_menu_route.dart';

//

class MainScreenManager extends StatelessWidget {
  const MainScreenManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(createRouteHorizontalSlide(const AdditionalMenu(
              userType: UserType.houseManager,
            )));
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
                        child: BuildingManagementOption(user: User.manager),
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(createRouteHorizontalSlide(const AdditionalMenu(
              userType: UserType.company,
            )));
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
      body: Consumer<ApprovedCommitteeNotifier>(
        builder: (context, committee, child) {
          return GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 10,
            ),
            crossAxisSpacing: 15,
            children: [
              ...committeeOptions.keys.map((String permission) {
                if (committee.permissions.contains(permission)) {
                  return mainMenuOptions[permission];
                }
                return null;
              }).whereType<Widget>(),
            ],
          );
        },
      ),
    );
  }
}

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
            Navigator.of(context).push(createRouteHorizontalSlide(
                const AdditionalMenu(userType: UserType.resident)));
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(createRouteHorizontalSlide(
                const AdditionalMenu(userType: UserType.serviceProvider)));
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
