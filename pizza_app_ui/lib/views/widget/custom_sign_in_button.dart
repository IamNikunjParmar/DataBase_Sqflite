import 'package:flutter/material.dart';

class CustomSignInButton extends StatelessWidget {
  final String imagePath;
  final String title;
  const CustomSignInButton({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: h * 0.062,
        width: w * 0.98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xffFFFFFF),
          border: Border.all(
            color: const Color(0xffE0E0E9),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff191919),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
