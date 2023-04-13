import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class ImageListView extends StatefulWidget {
  final int startIndex;
  const ImageListView({
    Key? key,
    required this.startIndex,
  }) : super(key: key);

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (!_scrollController.position.atEdge) {
        // implement scroll of list
        _autoScroll();
      }
      // adding to lisst
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoScroll();
      });
    });
  }

  void _autoScroll() {
    final currentScrollPosition = _scrollController.offset;
    final scrollEndPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
          duration: const Duration(seconds: 10),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.6,
        child: ListView.builder(
            controller: _scrollController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: products[widget.startIndex + index].productImageUrl,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10, right: 8, left: 8),
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                },
              );
            }),
      ),
    );
  }
}
