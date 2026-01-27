import 'package:flutter/material.dart';
import 'package:pos_client/pos_client.dart';

extension OrderItemStatusExtension on OrderItemStatus {
  bool get isPaid => this == OrderItemStatus.payed;
  bool get isUnPaid => this != OrderItemStatus.payed;
  Color get color {
    switch (this) {
      case OrderItemStatus.progress:
        return Colors.blueGrey;
      case OrderItemStatus.picked:
        return Colors.purple;
      case OrderItemStatus.ready:
        return Colors.orange;
      case OrderItemStatus.served:
        return Colors.blue;
      case OrderItemStatus.payed:
        return Colors.green;
    }
  }

  Color get color50 {
    switch (this) {
      case OrderItemStatus.progress:
        return Colors.blueGrey.shade50;
      case OrderItemStatus.picked:
        return Colors.purple.shade50;
      case OrderItemStatus.ready:
        return Colors.orange.shade50;
      case OrderItemStatus.served:
        return Colors.blue.shade50;
      case OrderItemStatus.payed:
        return Colors.green.shade50;
    }
  }

  Color get color700 {
    switch (this) {
      case OrderItemStatus.progress:
        return Colors.blueGrey.shade700;
      case OrderItemStatus.picked:
        return Colors.purple.shade700;
      case OrderItemStatus.ready:
        return Colors.orange.shade700;
      case OrderItemStatus.served:
        return Colors.blue.shade700;
      case OrderItemStatus.payed:
        return Colors.green.shade700;
    }
  }

  String get label {
    switch (this) {
      case OrderItemStatus.progress:
        return "In Progress";
      case OrderItemStatus.picked:
        return "Picked for Preparation";
      case OrderItemStatus.ready:
        return "Ready for Delivery";
      case OrderItemStatus.served:
        return "Delivered";
      case OrderItemStatus.payed:
        return "Paid";
    }
  }
}

extension TableStatusExtension on TableStatus? {
  String get label {
    switch (this) {
      case TableStatus.available:
        return "Available";
      case TableStatus.occupied:
        return "Occupied";
      case TableStatus.reserved:
        return "Reserved";
      default:
        return "Available";
    }
  }

  Color get color {
    switch (this) {
      case TableStatus.available:
        return Colors.green;
      case TableStatus.occupied:
        return Colors.red;
      case TableStatus.reserved:
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  Color get color50 {
    switch (this) {
      case TableStatus.available:
        return Colors.green.shade50;
      case TableStatus.occupied:
        return Colors.red.shade50;
      case TableStatus.reserved:
        return Colors.orange.shade50;
      default:
        return Colors.green.shade50;
    }
  }

  Color get color700 {
    switch (this) {
      case TableStatus.available:
        return Colors.green.shade700;
      case TableStatus.occupied:
        return Colors.red.shade700;
      case TableStatus.reserved:
        return Colors.orange.shade700;
      default:
        return Colors.green.shade700;
    }
  }
}

extension OrderStatusExtension on OrderStatus {
  bool get isPaid => this == OrderStatus.payed;
  bool get isUnPaid => this != OrderStatus.payed;
  Color get color {
    switch (this) {
      case OrderStatus.progress:
        return Colors.blueGrey;
      case OrderStatus.payed:
        return Colors.green;
    }
  }

  Color get color50 {
    switch (this) {
      case OrderStatus.progress:
        return Colors.blueGrey.shade50;
      case OrderStatus.payed:
        return Colors.green.shade50;
    }
  }

  Color get color100 {
    switch (this) {
      case OrderStatus.progress:
        return Colors.blueGrey.shade100;
      case OrderStatus.payed:
        return Colors.green.shade100;
    }
  }

  Color get color700 {
    switch (this) {
      case OrderStatus.progress:
        return Colors.blueGrey.shade700;
      case OrderStatus.payed:
        return Colors.green.shade700;
    }
  }
}
