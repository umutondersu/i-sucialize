// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:i_sucialize/databaseInterface.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final _nameController = TextEditingController();
  final _aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: ,
      appBar: EditProfileAppBar(),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.primary,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 250,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Change Your Username",
                      style:
                          TextStyle(color: AppColors.textcolor, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary, width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.backgroundcolor2,
                  ),
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _nameController,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        counter: null,
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.primary,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 250,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Edit Your About Section",
                      style:
                          TextStyle(color: AppColors.textcolor, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary, width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.backgroundcolor2,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 200,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextField(
                      controller: _aboutController,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        counter: null,
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.primary,
                    ),
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: 250,
                    height: 55,
                    child: TextButton(
                      onPressed: () {
                        if (_nameController.text.isNotEmpty) {
                          //print(databaseInterface.runtimeType);
                          databaseInterface.updateUserData({
                            "username": _nameController.text,
                          });
                          _nameController.clear();
                        }
                        if (_nameController.text.isNotEmpty) {
                          databaseInterface.updateUserData(
                              {"description": _aboutController.text});
                          _aboutController.clear();
                        }
                      },
                      child: Text(
                        "Save Changes",
                        style:
                            TextStyle(color: AppColors.textcolor, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.mainbackgroundcolor,
    );
  }
}

class EditProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  const EditProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.textcolor,
      backgroundColor: AppColors.primary,
      shadowColor: AppColors.secondary,
      leadingWidth: 80,
      leading: TextButton(
        child: CircleAvatar(
          radius: 100,
          child: ClipOval(
            child: Image.network(
              "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
              fit: BoxFit.cover,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text('Edit Profile'),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
      centerTitle: true,
    );
  }
}
