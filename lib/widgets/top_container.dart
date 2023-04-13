// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_clothes/utils/colors.dart';
import 'package:ecom_clothes/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key? key,
    required this.title,
    required this.searchBarTitle,
  }) : super(key: key);

  final String title;
  final String searchBarTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: kNormalStyle.copyWith(
                  fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreyColor.withOpacity(0.8),
              ),
              child: Stack(
                children: [
                  const Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.black87,
                    size: 20,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kOrangeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 40,
                width: 40,
                imageUrl:
                    'https://images.unsplash.com/photo-1576871337622-98d48d1cf531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80)',
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: kGreyColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                searchBarTitle,
                style: const TextStyle(
                    color: Colors.black38, fontWeight: FontWeight.w400),
              )
            ],
          ),
        )
      ],
    );
  }
}
