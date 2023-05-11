import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_with_laravel_api/helper/images.dart';

class BuildPage extends StatelessWidget {
  BuildPage({super.key, required this.images, required this.text});
  String images;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              alignment: Alignment.topCenter,
              images,
              fit: BoxFit.contain,
              width: 200,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 40,
              child: RichText(
                text: TextSpan(
                    text: text,
                    style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            )
          ],
        )),
      ),
    );
  }
}