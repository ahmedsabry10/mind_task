import 'package:task/core/helpers/spacing.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DialogWidgetItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final String? description;
  final VoidCallback onPressed;

  const DialogWidgetItem(
      {super.key,
      required this.title,
      required this.icon,
      this.description,
      required this.onPressed});

  @override
  State<DialogWidgetItem> createState() => _DialogWidgetItemState();
}

class _DialogWidgetItemState extends State<DialogWidgetItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: ColorsManager.mainRed,
              size: 25,
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: TextStyles.font15DarkBlueMedium),
                  verticalSpace(4),
                  Text(widget.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font14GrayRegular),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
