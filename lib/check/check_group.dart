// Copyright 2020 The CaiubiTech Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
library check_radio_group;

import 'package:check_radio_group/model/group_style.dart';
import 'package:check_radio_group/model/item_group.dart';
import 'package:flutter/material.dart';

class CheckGroup extends StatefulWidget {
  final List<GroupItem> items;
  final Function(List<GroupItem>) onSelectedItems;
  final GroupStyle style;

  const CheckGroup(
      {Key key,
      @required this.items,
      @required this.onSelectedItems,
      this.style})
      : super(key: key);

  @override
  _CheckGroupState createState() => _CheckGroupState();
}

class _CheckGroupState extends State<CheckGroup> {
  GroupStyle _groupStyle;

  List<GroupItem> _selectedItems = [];

  @override
  void initState() {
    setState(() {
      _groupStyle = widget.style ?? GroupStyle();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.items.map((item) {
        final pos = widget.items.indexOf(item);

        return CheckboxListTile(
          value: item.selected,
          controlAffinity: _groupStyle.checkPosition,
          activeColor: _groupStyle.activeColor ??
              Theme.of(context).toggleableActiveColor,
          title: Text(
            item.title,
            style: _groupStyle.titleStyle,
            textAlign: _groupStyle.titleAlign,
          ),
          subtitle: item?.subTitle != null
              ? Text(
                  item?.subTitle,
                  style: _groupStyle.titleStyle,
                  textAlign: _groupStyle.titleAlign,
                )
              : null,
          onChanged: (value) {
            setState(() {
              item.selected = value;

              if (!item.selected) {
                _selectedItems
                    .removeWhere((value) => value.hashCode == item.hashCode);
              } else {
                _selectedItems.add(item);
              }

              widget.onSelectedItems(_selectedItems);
            });
          },
          key: Key('$pos'),
        );
      }).toList(),
    );
  }
}
