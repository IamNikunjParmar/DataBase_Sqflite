import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/image_utils.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<AllHelps> myHelps = [
    AllHelps(
        text: 'How do I Place order for pizza?',
        subText:
            'You can order pizza using the IRCTCs Food on Track app to receive your order at a train station. You can also use the Dominos app to order pizza online.'),
    AllHelps(
        text: 'How long does it take for my order to be delivered?',
        subText: 'The time it takes for an order to be delivered depends on a variety of factors, including'),
    AllHelps(
        text: 'What payment methods are available?',
        subText:
            'Our app accepts various payment methods including credit cards, debit cards, and online wallets. Additionally, you can choose to pay with cash or credit card upon delivery.'),
    AllHelps(
        text: 'How can I cancel my order?',
        subText: ' The time window for cancellation varies by category and you cant cancel after the specified time. '),
    AllHelps(
        text: 'What should i do if there is a problem with my order?',
        subText: 'The time it takes for an order to be delivered depends on a variety of factors, including'),
    AllHelps(
        text: 'Are there any delivery fees?',
        subText:
            'Restaurants may charge delivery fees to cover the cost of bringing food to customers, even for small orders'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterHelps = myHelps;
  }

  int selected = 0;
  List filterHelps = [];
  String helps = "";

  void filterByHelps(String help) {
    setState(() {
      helps = help;
      filterHelps = myHelps.where((myHelps) => myHelps.text.startsWith(helps)).toList();
    });
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
            "Help and Support",
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
                  onChanged: filterByHelps,
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
              const Gap(15),
              Expanded(
                child: ListView.separated(
                  itemCount: filterHelps.length,
                  itemBuilder: (ctx, index) {
                    AllHelps allMyHelp = filterHelps[index];
                    return Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        title: Text(
                          allMyHelp.text,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.bottomColorTitle,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              allMyHelp.subText,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.textDisable,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllHelps {
  final String text;
  final String subText;

  AllHelps({required this.text, required this.subText});
}
