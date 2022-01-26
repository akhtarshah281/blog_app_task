import 'dart:async';
import 'dart:io';
import 'package:blog_app_task/utils/app_colors.dart';
import 'package:blog_app_task/utils/app_constants.dart';
import 'package:blog_app_task/utils/assets.dart';
import 'package:blog_app_task/utils/screen_dimensions.dart';
import 'package:blog_app_task/widgets/app_bar.dart';
import 'package:blog_app_task/widgets/app_text.dart';
import 'package:blog_app_task/widgets/status_bar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'add_post_vm.dart';

class AddPostScreen extends StatefulWidget {
  static const String routeName = AppConstants.addPostRoute;

  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  XFile? file;
  File? _imageFile;
  String? imageUrl;
  final maxLinesTitle = 1;
  final maxLinesDesc = 5;
  late StreamSubscription<bool> subscription;
  bool keyboard = false;

  @override
  void initState() {
    super.initState();
    subscription = KeyboardVisibilityController().onChange.listen((event) {
      //invert keyboard value to either false or true on keyboard listener
      keyboard = !keyboard;
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider? provider;
    if (_imageFile != null) {
      provider = FileImage(_imageFile!);
    }
    return Consumer<AddPostVM>(
        builder: (context, vm, _) => annotatedRegion(
            AppColors.MAROON,
            SafeArea(
              child: Scaffold(
                /* to achieve scenerio where button should be invisible when keyboard opens
                , so if we put the button etc in bottomNavigationBar then on keyboard open the button is no
                more visible... i.e
                 "
                 bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BottomAppBar(
                    child:  SizedBox(
                      width: getScreenWidth(context),
                      height: 50,
                      child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10))),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  AppColors.MAROON)),
                          onPressed: vm.isLoading
                              ? null
                              : () {
                            // vm.addPost(
                            //     context: context,
                            //     file: _imageFile!);
                          },
                          child: vm.isLoading
                              ? SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                AlwaysStoppedAnimation<Color>(
                                    Colors.amberAccent),
                              ))
                              : Text(
                            'Submit',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.WHITE),
                          )),
                    ),
                  ),
                )
                "
                Note: there is also 2nd solution by using flutter_keyboard_visibility plugin
                used in this project below:
            */
                //using App bar when having a separate Widget for App Bar and use it anyWhere in project
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: appBar(
                      text: 'Posts',
                      // iconButton: IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(Icons.arrow_back),
                      // ),
                      color: AppColors.MAROON),
                ),
                body: Container(
                  width: getScreenWidth(context),
                  height: getScreenHeight(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Stack(children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: getScreenWidth(context),
                              height: getScreenHeight(context) / 3,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.GREY),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                children: [
                                  provider != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.file(_imageFile!,
                                            width: getScreenWidth(context),
                                            fit: BoxFit.fill,))
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.asset(
                                            Assets.food,
                                            width: getScreenWidth(context),
                                            fit: BoxFit.fill,
                                          )),
                                  Positioned(
                                    right: 15,
                                    bottom: 15,
                                    child: GestureDetector(
                                      onTap: () async {
                                        XFile? file = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        setState(() {
                                          if (file != null) {
                                            _imageFile = File(file.path);
                                            // print(_imageFile!.path);
                                          } else {
                                            return;
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                          child: Icon(Icons.camera_alt),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 20,
                            ),
                            PrimaryText(
                              'Title:',
                              color: AppColors.BLACK,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 150,
                            ),
                            Container(
                              margin: EdgeInsets.all(12),
                              height: maxLinesTitle * 50.0,
                              child: TextField(
                                controller: vm.titleController,
                                maxLines: maxLinesTitle,
                                decoration: InputDecoration(
                                  hintText: "Enter a Title",
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 50,
                            ),
                            PrimaryText(
                              'Description:',
                              color: AppColors.BLACK,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 150,
                            ),
                            TextField(
                              controller: vm.descController,
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          /*
                          this is 2nd Solution I mentioned above for showing any Widget when
                          keyboard is not opened. and visible in case keyboard is not opened
                          */
                          child: keyboard
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: BottomAppBar(
                                    child: SizedBox(
                                      width: getScreenWidth(context),
                                      height: 50,
                                      child: TextButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(AppColors.MAROON)),
                                          onPressed: vm.isLoading
                                              ? null
                                              : () {
                                                  vm.addPost(
                                                      context: context,
                                                      file: _imageFile);
                                                },
                                          child: vm.isLoading
                                              ? const SizedBox(
                                                  width: 16,
                                                  height: 16,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.amberAccent),
                                                  ))
                                              : const Text(
                                                  'Submit',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color: AppColors.WHITE),
                                                )),
                                    ),
                                  ),
                                ))
                    ]),
                  ),
                ),
              ),
            )));
  }
}
