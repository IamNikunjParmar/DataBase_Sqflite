import 'package:flutter/material.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';

class CustomBottomSheet extends StatelessWidget {
  final Container container;
  final String imagePath;
  final String title;
  final String subtext;
  final String buttonTitle;
  final VoidCallback onPressed;

  const CustomBottomSheet({
    super.key,
    required this.container,
    required this.imagePath,
    required this.title,
    required this.subtext,
    required this.buttonTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 6,
          width: 70,
          color: const Color(0xffDFE2EB),
        ),
        const SizedBox(
          height: 16,
        ),
        Image(
          image: AssetImage(imagePath),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          subtext,
          style: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 52,
          width: 360,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xff5C0319),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
