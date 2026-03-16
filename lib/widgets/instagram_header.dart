import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstagramHeader extends StatelessWidget {
  const InstagramHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 40,
        left: 16,
        right: 16,
        bottom: 10,
      ),
      child: Row(
        children: [

          const FaIcon(
            FontAwesomeIcons.plus,
            size: 24,
          ),

          const SizedBox(width: 75),

          const Text(
            "Instagram",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w500,
              fontFamily: "Billabong",
              color: Colors.black,
              height: 1,
              //letterSpacing: -1.5
            ),
          ),

          const Spacer(),

          const FaIcon(
            FontAwesomeIcons.heart,
            size: 24,
          ),
        ],
      ),
    );
  }
}