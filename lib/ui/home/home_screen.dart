import 'package:blog_app_task/ui/home/home_vm.dart';
import 'package:blog_app_task/utils/app_colors.dart';
import 'package:blog_app_task/utils/app_constants.dart';
import 'package:blog_app_task/utils/functions.dart';
import 'package:blog_app_task/utils/screen_dimensions.dart';
import 'package:blog_app_task/widgets/app_bar.dart';
import 'package:blog_app_task/widgets/status_bar_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = AppConstants.homeRoute;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
        builder: (context, vm, _) => annotatedRegion(
            AppColors.MAROON,
            SafeArea(
              child: Scaffold(
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0,right: 20 ),
                  child: FloatingActionButton(
                    onPressed: () {
                      Functions.toNextScreen(context: context, routeName: AppConstants.addPostRoute);
                    },
                    child: Icon(Icons.add),
                  ),
                ),
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: appBar(
                      text: 'Posts',
                      iconButton: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back),
                      ),
                    color: AppColors.MAROON
                    ),
                ),
                body: Container(
                  width: getScreenWidth(context),
                  height: getScreenHeight(context),
                  child: ListView.builder(
                      itemCount: vm.dataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: vm.dataList[index].imageUrl,
                            ),
                            title: Text(vm.dataList[index].title));
                      }),
                ),
              ),
            )));
  }
}
