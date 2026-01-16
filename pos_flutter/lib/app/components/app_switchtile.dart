import 'package:flutter/material.dart';

import '../themes/apptheme.dart';

class AppSwitchtile extends StatelessWidget {
  final String title;
  final String description;
  final bool value;
  final void Function(bool?)? onChanged;

  const AppSwitchtile({
    super.key,
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: value
            ? AppTheme().primary.withValues(alpha: 0.05)
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: value
              ? AppTheme().primary.withValues(alpha: 0.3)
              : Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: SwitchListTile.adaptive(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
        value: value,
        onChanged: onChanged,
        dense: true,
      ),
    );
  }
}
