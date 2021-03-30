part of '../helper.dart';

/// `IconLabel(icon: Icon(), label: 'teks')`
class IconLabel extends StatelessWidget {
  final Icon icon;
  final double labelSpace;
  final String label;
  final Color labelColor;
  final FontWeight fontWeight;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextOverflow overflow;
  final bool softWrap;

  IconLabel(
      {this.icon,
      this.labelSpace: 7,
      this.label,
      this.fontWeight,
      this.labelColor,
      this.mainAxisAlignment: Maa.start,
      this.mainAxisSize,
      this.overflow,
      this.softWrap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? Mas.max,
      children: [
        icon,
        SizedBox(width: labelSpace),
        Flexible(
            child: Text('$label',
                style: Config.font.copyWith(fontWeight: fontWeight ?? FontWeight.bold, color: labelColor ?? C.black),
                overflow: overflow,
                softWrap: softWrap))
      ],
    );
  }
}
