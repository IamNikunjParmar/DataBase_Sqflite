import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pizza_app_ui/modal/catgory_data_modal.dart';
import 'package:pizza_app_ui/views/widget/custom_bottom_sheet.dart';

import '../../../../utils/color_utils.dart';
import '../../../../utils/image_utils.dart';
import '../../widget/custom_basket_container.dart';
import '../../widget/custom_container_basket.dart';
import '../../widget/custom_tracking_product.darft.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  int selected = 0;
  int masterCardSelected = 0;

  setSelectedRadio(int val) {
    setState(() {
      selected = val;
    });
  }

  setMasterCardRadio(int val) {
    setState(() {
      masterCardSelected = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = 0;
    masterCardSelected = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.bgColorScreen,
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Help",
                style: TextStyle(
                  color: AppColor.dotIndicator,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
          toolbarHeight: 70,
          backgroundColor: AppColor.bgColorScreen,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.4),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Colors.red,
                  value: 0.1,
                  minHeight: 6,
                  valueColor: AlwaysStoppedAnimation(AppColor.dotIndicator),
                ),
                Image(
                  image: AssetImage(ImagePath.trackingImage),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Estimated Time of Arrival",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(8),
              Container(
                height: 78,
                width: 380,
                decoration: const BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "11:10",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Gap(5),
                              Text(
                                "AM",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff52525B),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "10:32 AM",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff8B8B91),
                                ),
                              ),
                              Text(
                                "Food is on your way",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(16),
              const Text(
                "Your Rider",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(8),
              Container(
                height: 80,
                width: 380,
                decoration: const BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(ImagePath.dpImage),
                            ),
                          ),
                        ),
                        title: const Text(
                          "Tony Stark",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Image(
                          image: AssetImage(ImagePath.phoneFlipImage),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(16),
              const Text(
                "Products(3)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(8),
              CustomTrackingProduct(
                title: "Diavola Pizza",
                subTitle: "Thin Crust",
                price: "£9.99",
                imagePath: ImagePath.pizzasImage4,
                endTitle: "Extra Mushrooms",
              ),
              const Gap(12),
              CustomTrackingProduct(
                title: "Pepperoni Breadsticks",
                subTitle: "8 Units",
                price: "£2.99",
                imagePath: ImagePath.breadImage,
                endTitle: "Additional Marinara Sauce",
              ),
              const Gap(12),
              CustomTrackingProduct(
                title: "Coca Cola 350ml.",
                subTitle: "Thin Crust",
                price: "£9.99",
                imagePath: ImagePath.cokeImage,
                endTitle: "Extra Mushrooms",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
