import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:pizza_app_ui/modal/catgory_data_modal.dart';
import 'package:pizza_app_ui/utils/color_utils.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectRadioTile = 0;
  int count = 1;
  bool _isChecked = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;

  setSelectRadioTile(int val) {
    setState(() {
      selectRadioTile = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectRadioTile = 0;
    _isChecked = false;
    _isChecked1 = false;
    _isChecked2 = false;
    _isChecked3 = false;
    _isChecked4 = false;

    //count = 1;
  }

  @override
  Widget build(BuildContext context) {
    final CategoryData pro = ModalRoute.of(context)!.settings.arguments as CategoryData;

    return Scaffold(
      backgroundColor: AppColor.bgColorScreen,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 275.0,
            backgroundColor: AppColor.bgColorScreen,
            elevation: 0.0,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                pro.image,
                fit: BoxFit.cover,
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                height: 32.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColor.bgColorScreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
              ),
            ),
            // leadingWidth: 80.0,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28.0),
                  // child: BackdropFilter(filter: ColorFilter.matrix(),
                  child: Container(
                    height: 28.0,
                    width: 28.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pro.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColor.proDetailsTitleColor,
                        ),
                      ),
                      Text(
                        "£${pro.price.toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                    ],
                  ),
                  const Gap(5),
                  Text(
                    pro.subtitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColor.textDisable,
                    ),
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Crust Type",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColor.proDetailsTitleColor,
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 81,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColor.dotIndicator,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Mandatory",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 1.13,
                    child: RadioListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      value: 1,
                      groupValue: selectRadioTile,
                      onChanged: (val) {
                        setSelectRadioTile(val!);
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Thin Crust",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.99",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.13,
                    child: RadioListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      value: 2,
                      groupValue: selectRadioTile,
                      onChanged: (val) {
                        setSelectRadioTile(val!);
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Thick Crust",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£1.99",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Extra Toppings",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColor.proDetailsTitleColor,
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 81,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xffEEEEEF),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Optional",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColor.textDisable,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Extra Cheese",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.99",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked1,
                      onChanged: (val) {
                        setState(() {
                          _isChecked1 = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Extra Cheese",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.50",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked2,
                      onChanged: (val) {
                        setState(() {
                          _isChecked2 = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Mushrooms",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.20",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked3,
                      onChanged: (val) {
                        setState(() {
                          _isChecked3 = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Olives",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.70",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked4,
                      onChanged: (val) {
                        setState(() {
                          _isChecked4 = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Peppers",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.50",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  const Gap(10),
                  Container(
                    height: 80,
                    width: 400,
                    padding: const EdgeInsets.all(16),
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45,
                          width: 96,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    count--;
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                              Text(count.toString()),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 202,
                          decoration: const BoxDecoration(
                            color: AppColor.dotIndicator,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Add to Basket:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              Text(
                                "£12.99",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked4,
                      onChanged: (val) {
                        setState(() {
                          _isChecked4 = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Spicy Salami",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  const Gap(10),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      // fillColor: WidgetStateProperty.all(Colors.red),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked4,
                      onChanged: (val) {
                        setState(() {
                          _isChecked4 = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Black Olives",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Dips/Sauces",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColor.proDetailsTitleColor,
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 81,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xffEEEEEF),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Optional",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColor.textDisable,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Green Sauce",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.99",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked1,
                      onChanged: (val) {
                        setState(() {
                          _isChecked1 = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Roasted Garlic Mayo",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.50",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked2,
                      onChanged: (val) {
                        setState(() {
                          _isChecked2 = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Hot Honey Ranch Sauce",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.20",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked3,
                      onChanged: (val) {
                        setState(() {
                          _isChecked3 = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Spicy Mayo",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.70",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.13,
                    child: CheckboxListTile(
                      side: const BorderSide(
                        color: AppColor.checkBoxColor,
                        width: 2,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked4,
                      onChanged: (val) {
                        setState(() {
                          _isChecked4 = val!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "Sweet Chilli And Lime Sauce",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.proDetailsTitleColor,
                          ),
                        ),
                      ),
                      secondary: const Text(
                        "+£0.50",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.dotIndicator,
                        ),
                      ),
                      activeColor: AppColor.dotIndicator,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
