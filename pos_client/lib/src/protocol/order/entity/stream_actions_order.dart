/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum StreamActionsOrder implements _i1.SerializableModel {
  new_order,
  append_order_items,
  pay_items,
  pay_all_items;

  static StreamActionsOrder fromJson(String name) {
    switch (name) {
      case 'new_order':
        return StreamActionsOrder.new_order;
      case 'append_order_items':
        return StreamActionsOrder.append_order_items;
      case 'pay_items':
        return StreamActionsOrder.pay_items;
      case 'pay_all_items':
        return StreamActionsOrder.pay_all_items;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "StreamActionsOrder"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
