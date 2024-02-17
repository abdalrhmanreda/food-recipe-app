import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:icons_plus/icons_plus.dart';

import 'more_details_item.dart';

class MoreDetails extends StatelessWidget {
  const MoreDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List<MoreItemModel> moreItems = [
      MoreItemModel(text: '15\nMin', icon: IconlyBold.timeCircle),
      MoreItemModel(text: "03\nServings", icon: Iconsax.people_outline),
      MoreItemModel(
          text: "103\nCal", icon: Icons.local_fire_department_outlined),
      MoreItemModel(text: "Easy", icon: Iconsax.layer_outline),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: moreItems
          .map((e) => MoreDetailsItem(
                icon: e.icon!,
                text: e.text!,
              ))
          .toList(),
    );
  }
}

class MoreItemModel {
  String? text;
  IconData? icon;
  MoreItemModel({this.text, this.icon});
}
