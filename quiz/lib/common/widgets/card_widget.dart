// import 'package:career_lift_mobile_app/common/resources/style/app_text_style.dart';
// import 'package:career_lift_mobile_app/common/resources/style/decoration.dart';
// import 'package:career_lift_mobile_app/common/utilities/util.dart';
// import 'package:career_lift_mobile_app/common/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/Resources/style/app_text_style.dart';
import 'package:quiz/common/Resources/style/decoration.dart';
import 'package:quiz/common/utilities/util.dart';
import 'package:quiz/common/widgets/text_widget.dart';

class CardWidget extends StatelessWidget {
  final String cardTitle;
  final Function()? onCardTapped;
  final Color iconFilledColor;

  const CardWidget({
    Key? key,
    required this.cardTitle,
    required this.onCardTapped,
    required this.iconFilledColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(buildWidth(context) * 0.02),
      child: Material(
        elevation: 10,
        shape: Shape.rectangleBorder10,
        child: ListTile(
            onTap: onCardTapped,
            title: TextWidget(cardTitle, style: AppTextStyle.cardTitleStyle),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: iconFilledColor,
              size: 30,
            )),
      ),
    );
  }
}
