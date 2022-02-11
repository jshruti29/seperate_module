//import 'package:career_lift_mobile_app/common/resources/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/Resources/style/app_text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

typedef OnInputChangedCallback = void Function(String?);

class DropDownWidget extends StatefulWidget {
  final String chosenVal;
  final List<String> _menuItem;
  final ValueChanged<String?> dropdownMenuChanged;

  const DropDownWidget(
    this.chosenVal,
    this._menuItem,
    this.dropdownMenuChanged,
  );

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: widget.chosenVal,
              items: widget._menuItem.map((location) {
                return DropdownMenuItem(
                  child: new Text(
                    location,
                    style: AppTextStyle.listTitleStyle,
                  ),
                  value: location,
                );
              }).toList(),
              onChanged: widget.dropdownMenuChanged,
            )));
  }
}
