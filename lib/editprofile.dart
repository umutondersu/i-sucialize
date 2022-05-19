// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:i_sucialize/util/colors.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final _name = TextEditingController();
  final _status = TextEditingController();
  final _about = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditProfileAppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.all(30)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.primary,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 200,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Edit Your Name",
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
                  width: 400,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      style: TextStyle(color: AppColors.textcolor),
                      controller: _name,
                      textAlign: TextAlign.left,
                      maxLength: 50,
                      decoration: InputDecoration(
                        counter: null,
                        hintStyle: TextStyle(color: AppColors.textcolor),
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
                  width: 200,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Edit Your Status",
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
                  width: 400,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      style: TextStyle(color: AppColors.textcolor),
                      controller: _status,
                      textAlign: TextAlign.left,
                      maxLength: 50,
                      decoration: InputDecoration(
                        counter: null,
                        hintStyle: TextStyle(color: AppColors.textcolor),
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
                  width: 400,
                  height: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      style: TextStyle(color: AppColors.textcolor),
                      controller: _about,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: AppColors.textcolor),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(30)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColors.primary,
                      ),
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 250,
                      height: 75,
                      child: TextButton(
                        onPressed: () {
                          _name.clear();
                          _status.clear();
                          _about.clear();
                        },
                        child: Text(
                          "Save Changes",
                          style: TextStyle(
                              color: AppColors.textcolor, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundcolor,
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
      leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextButton(
            child: CircleAvatar(
              radius: 100,
              child: ClipOval(
                child: Image.network(
                  "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onPressed: () {},
          )),
      title: const Text('Edit Profile'),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        )
      ],
      centerTitle: true,
    );
  }
}
