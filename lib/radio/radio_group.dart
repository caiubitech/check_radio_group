import 'package:check_radio_group/model/group_style.dart';
import 'package:check_radio_group/model/item_group.dart';
import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  final List<GroupItem> items;
  final GroupItem selected;
  final Function(GroupItem) onSelected;
  final GroupStyle style;

  const RadioGroup(
      {Key key,
      @required this.items,
      @required this.onSelected,
      this.style,
      this.selected})
      : super(key: key);

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  GroupItem _selected;
  GroupStyle _groupStyle;

  @override
  void initState() {
    setState(() {
      _selected = widget?.selected ?? null;
    });

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

        return RadioListTile(
            key: Key('$pos${item.title}'),
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
            controlAffinity: _groupStyle.checkPosition,
            dense: true,
            activeColor: _groupStyle?.activeColor ??
                Theme.of(context).toggleableActiveColor,
            groupValue: widget.items.indexOf(_selected),
            value: pos,
            onChanged: (var index) => setState(() {
                  _selected = item;
                  widget.onSelected(item);
                }));
      }).toList(),
    );
  }
}
