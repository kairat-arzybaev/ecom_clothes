import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_clothes/data/data.dart';
import 'package:ecom_clothes/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryDisplayScreen extends StatefulWidget {
  const CategoryDisplayScreen({super.key});

  @override
  State<CategoryDisplayScreen> createState() => _CategoryDisplayScreenState();
}

class _CategoryDisplayScreenState extends State<CategoryDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: [
          const TopContainer(
              title: 'Category', searchBarTitle: 'Search category'),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 170,
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          categories[index].thumbnailImage,
                        ),
                        fit: BoxFit.cover),
                  ),
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.transparent,
                  ], begin: Alignment.bottomCenter, end: Alignment.center)),
                  child: Stack(
                    children: [
                      Positioned(
                          left: 10,
                          bottom: 10,
                          child: Column(
                            children: [
                              Text(
                                categories[index].categoryName,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${categories[index].productCount} Products',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ))
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
