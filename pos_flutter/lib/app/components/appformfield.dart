import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    this.label,
    this.pIcon,
    this.suffix,
    this.sIcon,
    this.isNumeric = false,
    this.readOnly = false,
    this.hint,
    this.ctr,
    this.onTap,
    this.validator,
    this.isOutsideLabel = false,
    this.maxLines,
    this.minLines = 1,
    this.buildCounter,
    this.onChanged,
  });
  const AppFormField.label({
    super.key,
    this.isNumeric = false,
    this.pIcon,
    this.suffix,
    this.sIcon,
    this.label,
    this.onTap,
    this.readOnly = false,
    this.hint,
    this.ctr,
    this.validator,
    this.isOutsideLabel = true,
    this.maxLines,
    this.minLines = 1,
    this.buildCounter,
    this.onChanged,
  }) : assert(
         isOutsideLabel == true || label != null,
         "If isOutsideLabel is false, label must not be null",
       );
  final bool isOutsideLabel, readOnly;
  final String? label;
  final String? hint;
  final TextEditingController? ctr;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int minLines;
  final VoidCallback? onTap;
  final bool isNumeric;
  final Widget? pIcon, suffix, sIcon;
  final InputCounterWidgetBuilder? buildCounter;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: .start,
      children: [
        if (isOutsideLabel && label != null) AppLabel(label: label),
        TextFormField(
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          keyboardType: isNumeric
              ? TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          maxLines: maxLines ?? minLines,
          minLines: minLines,
          buildCounter: buildCounter,
          decoration: InputDecoration(
            prefixIcon: pIcon,
            suffixIcon: sIcon,
            suffix: suffix,
            label: (label != null && !isOutsideLabel) ? Text(label!) : null,
            hintText: hint,
          ),
          controller: ctr,
          validator: validator,
        ),
      ],
    );
  }
}

class AppLabel extends StatelessWidget {
  const AppLabel({super.key, required this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(label!, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}
