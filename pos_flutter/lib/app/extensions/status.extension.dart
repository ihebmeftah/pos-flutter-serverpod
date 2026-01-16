import 'package:flutter/material.dart';
import 'package:pos_client/pos_client.dart';

extension OrderItemStatusExtension on OrderItemStatus {
  bool get isPaid => this == OrderItemStatus.payed;
  bool get isUnPaid => this != OrderItemStatus.payed;
  Color get color {
    switch (this) {
      case OrderItemStatus.progress:
        return Colors.blue;
      case OrderItemStatus.picked:
        return Colors.purple;
      case OrderItemStatus.ready:
        return Colors.orange;
      case OrderItemStatus.delivered:
        return Colors.green;
      case OrderItemStatus.payed:
        return Colors.green.shade600;
    }
  }

  Color get color50 {
    switch (this) {
      case OrderItemStatus.progress:
        return Colors.blue.shade50;
      case OrderItemStatus.picked:
        return Colors.purple.shade50;
      case OrderItemStatus.ready:
        return Colors.orange.shade50;
      case OrderItemStatus.delivered:
        return const Color.fromRGBO(232, 245, 233, 1);
      case OrderItemStatus.payed:
        return Colors.green.shade100;
    }
  }

  Color get color700 {
    switch (this) {
      case OrderItemStatus.progress:
        return Colors.blue.shade700;
      case OrderItemStatus.picked:
        return Colors.purple.shade700;
      case OrderItemStatus.ready:
        return Colors.orange.shade700;
      case OrderItemStatus.delivered:
        return Colors.green.shade700;
      case OrderItemStatus.payed:
        return Colors.green.shade900;
    }
  }
}

extension TableStatusExtension on TableStatus {
  Color get color {
    switch (this) {
      case TableStatus.available:
        return Colors.green;
      case TableStatus.occupied:
        return Colors.red;
      case TableStatus.reserved:
        return Colors.orange;
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
    }
  }
}

extension OrderStatusExtension on OrderStatus {
  bool get isPaid => this == OrderStatus.payed;
  bool get isUnPaid => this != OrderStatus.payed;
  Color get color {
    switch (this) {
      case OrderStatus.progress:
        return Colors.blue;
      case OrderStatus.payed:
        return Colors.green.shade600;
    }
  }

  Color get color50 {
    switch (this) {
      case OrderStatus.progress:
        return Colors.blue.shade50;
      case OrderStatus.payed:
        return Colors.green.shade100;
    }
  }

  Color get color700 {
    switch (this) {
      case OrderStatus.progress:
        return Colors.blue.shade700;
      case OrderStatus.payed:
        return Colors.green.shade900;
    }
  }
}
