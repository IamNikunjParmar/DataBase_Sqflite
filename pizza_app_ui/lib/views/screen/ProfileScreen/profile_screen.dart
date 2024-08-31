import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pizza_app_ui/utils/color_utils.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';
import 'package:pizza_app_ui/views/widget/custom_bottom_sheet.dart';
import 'dart:io';

import '../../widget/custom_profile_container.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchValue = false;
  bool notificationValue = true;

  File? _image;
  final picker = ImagePicker();

  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    try {
      final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          showModalBottomSheet(
              context: (context),
              builder: (BuildContext context) {
                return Container(
                  height: 318,
                  width: 400,
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: CustomBottomSheet(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        MyRoutes.homeScreen,
                        (route) => false,
                      );
                    },
                    container: Container(),
                    title: "Your profile picture has been \n      successfully changed!",
                    imagePath: "assets/icons/true.png",
                    buttonTitle: "Go to Homepage",
                    subtext: "",
                  ),
                );
              });
        }
      });

      return pickedFile;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MyRoutes.homeScreen);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Text(
          "Account",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff0A0D14),
          ),
        ),
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffFAFAFA),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 104,
              width: 360,
              //alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xD000000),
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xff5C0319),
                            width: 2,
                          ),
                          image: (_image == null)
                              ? DecorationImage(
                                  image: AssetImage(ImagePath.profilePicImage),
                                )
                              : DecorationImage(
                                  image: FileImage(_image!),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(40, 38),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              pickImage();
                            });
                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: const BoxDecoration(
                              color: AppColor.dotIndicator,
                              shape: BoxShape.circle,
                              // image: DecorationImage(
                              //   image: AssetImage("assets/icons/edit.png"),
                              // ),
                            ),
                            child: Transform.scale(
                              origin: const Offset(2, -2),
                              scale: 0.58,
                              child: Image(
                                alignment: Alignment.center,
                                color: const Color(0xffFFFFFF),
                                image: AssetImage(ImagePath.editImage),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John DOE",
                          style: TextStyle(
                            color: Color(0xff1F272D),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "020 7946 0559",
                          style: TextStyle(
                            color: Color(0xff75757C),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "johndoe@gmail.com",
                          style: TextStyle(
                            color: Color(0xff75757C),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xD000000),
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "General",
                          style: TextStyle(
                            color: Color(0xff75757C),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        CustomProfileContainer(
                          title: 'Personal Information',
                          subtitle: 'Change your account information',
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyRoutes.accountInformationScreen);
                          },
                          imagePath: ImagePath.contactImage,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xffE9E9EA),
                        ),
                        CustomProfileContainer(
                          title: 'Change Password',
                          subtitle: 'Change your account',
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyRoutes.changePasswordScreen);
                          },
                          imagePath: ImagePath.lockImage,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xffE9E9EA),
                        ),
                        CustomProfileContainer(
                          title: 'Payment Methods',
                          subtitle: 'Add your credit or debit card',
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyRoutes.paymentMethodScreen);
                          },
                          imagePath: ImagePath.creditCardImage,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xffE9E9EA),
                        ),
                        CustomProfileContainer(
                          title: 'Order History',
                          subtitle: 'View past orders',
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyRoutes.orderHistoryScreen);
                          },
                          imagePath: ImagePath.cartImage,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xffE9E9EA),
                        ),
                        CustomProfileContainer(
                          title: 'Favourites',
                          subtitle: 'View favourites pizza',
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyRoutes.favouriteScreen);
                          },
                          imagePath: ImagePath.heartImage,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xffE9E9EA),
                        ),
                        CustomProfileContainer(
                          title: 'Delivery Location',
                          subtitle: 'Add an address to receive',
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyRoutes.deliveryScreen);
                          },
                          imagePath: ImagePath.locationImage,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xffE9E9EA),
                        ),
                        CustomProfileContainer(
                          title: 'Language',
                          subtitle: 'Change the app language',
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyRoutes.languageScreen);
                          },
                          imagePath: ImagePath.languageImage,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xffE9E9EA),
                        ),
                        CustomProfileContainer(
                          title: 'FAQ',
                          subtitle: 'Find answers to your questions here',
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyRoutes.faqScreen);
                          },
                          imagePath: ImagePath.questionImage,
                        ),
                        const SizedBox(
                          height: 24,
                        ),

                        //Notifications

                        const Text(
                          "Notifications",
                          style: TextStyle(
                            color: Color(0xff75757C),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 64,
                          width: 350,
                          decoration: const BoxDecoration(
                              // color: Colors.red,
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffE9E9EA),
                                      ),
                                    ),
                                    child: Image(
                                      color: AppColor.dotIndicator,
                                      image: AssetImage(ImagePath.notificationImage),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16, top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Notifications",
                                          style: TextStyle(
                                            color: Color(0xff1F272D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "You will receive daily update",
                                          style: TextStyle(
                                            color: Color(0xff797D81),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35, bottom: 15),
                                child: Switch(
                                  activeColor: Colors.white,
                                  activeTrackColor: AppColor.dotIndicator,
                                  value: notificationValue,
                                  onChanged: (val) {
                                    setState(() {
                                      notificationValue = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xffE9E9EA),
                        ),
                        Container(
                          height: 64,
                          width: 350,
                          decoration: const BoxDecoration(
                              // color: Colors.red,
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffE9E9EA),
                                      ),
                                    ),
                                    child: Image(
                                      color: AppColor.dotIndicator,
                                      image: AssetImage(ImagePath.discountImage),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16, top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Promotional Notifications",
                                          style: TextStyle(
                                            color: Color(0xff1F272D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Get notified when promotions",
                                          style: TextStyle(
                                            color: Color(0xff797D81),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0, bottom: 15),
                                child: Switch(
                                  activeColor: Colors.white,
                                  activeTrackColor: AppColor.dotIndicator,
                                  value: switchValue,
                                  onChanged: (val) {
                                    setState(() {
                                      switchValue = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
