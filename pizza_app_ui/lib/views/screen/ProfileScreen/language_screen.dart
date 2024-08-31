import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/image_utils.dart';

class LanguageScreen extends StatefulWidget {
  LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final List<AllCountry> languageName = [
    AllCountry(language: "English", image: ImagePath.ukImage),
    AllCountry(language: "Turkish", image: ImagePath.turkishImage),
    AllCountry(language: "Italian", image: ImagePath.italianImage),
    AllCountry(language: "Chinese", image: ImagePath.chineseImage),
  ];

  int selected = 0;
  List filterLanguage = [];
  String language = "";

  void filterByLanguage(String lang) {
    setState(() {
      language = lang;
      filterLanguage = languageName.where((languageName) => languageName.language.startsWith(language)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterLanguage = languageName;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        appBar: AppBar(
          backgroundColor: AppColor.bgColorScreen,
          title: const Text(
            "Language",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff0A0D14),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56,
                child: TextFormField(
                  onChanged: filterByLanguage,
                  decoration: InputDecoration(
                    label: const Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.textDisable,
                      ),
                    ),
                    suffixIcon: Image(
                      image: AssetImage(ImagePath.searchImage),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(
                        color: AppColor.dotIndicator,
                      ),
                    ),
                    enabled: true,
                    fillColor: AppColor.whiteColor,
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(
                        color: AppColor.checkBoxColor,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(24),
              const Text(
                "Suggested Languages",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.bottomColorTitle,
                ),
              ),
              const Gap(15),
              Expanded(
                child: ListView.builder(
                    itemCount: filterLanguage.length,
                    itemBuilder: (ctx, index) {
                      AllCountry myCountry = filterLanguage[index];
                      return Container(
                        height: 45,
                        width: 350,
                        margin: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColor.whiteColor,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 12,
                            child: Image.asset(
                              myCountry.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(myCountry.language),
                          trailing: Radio(
                            activeColor: AppColor.dotIndicator,
                            value: filterLanguage.length,
                            groupValue: selected,
                            onChanged: (val) {},
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AllCountry {
  String language;
  String image;

  AllCountry({required this.image, required this.language});
}
