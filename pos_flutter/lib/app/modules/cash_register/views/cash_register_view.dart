import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/cash_register_controller.dart';

class CashRegisterView extends GetView<CashRegisterController> {
  const CashRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash Register'),
        centerTitle: true,
      ),
      body: controller.obx(
        (_) => RefreshIndicator(
          onRefresh: controller.getCashRegisters,
          child: Column(
            children: [
              _buildCurrentRegisterSection(),
              const Divider(height: 1),
              Expanded(child: _buildRegisterList()),
            ],
          ),
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(error ?? 'An error occurred'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.getCashRegisters,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentRegisterSection() {
    return Obx(() {
      final currentRegister = controller.cashRegisters.firstWhereOrNull(
        (cr) => !cr.isClosed,
      );

      return Container(
        padding: const EdgeInsets.all(16),
        color: currentRegister != null
            ? Colors.green.shade50
            : Colors.grey.shade50,
        child: currentRegister != null
            ? _buildCurrentRegisterCard(currentRegister)
            : _buildOpenRegisterButton(),
      );
    });
  }

  Widget _buildCurrentRegisterCard(dynamic register) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.point_of_sale, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current Cash Register',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Opened: ${_formatDateTime(register.start)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: controller.closeCashRegister,
              icon: const Icon(Icons.close),
              label: const Text('Close'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(130, 40),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOpenRegisterButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: controller.createCashRegister,
        icon: const Icon(Icons.add_circle_outline),
        label: const Text('Open New Cash Register'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildRegisterList() {
    return Obx(() {
      final registers = controller.cashRegisters;

      if (registers.isEmpty) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.history, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No cash registers yet',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: registers.length,
        itemBuilder: (context, index) {
          final register = registers[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: register.isClosed
                      ? Colors.grey.shade300
                      : Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.point_of_sale,
                  color: register.isClosed ? Colors.grey : Colors.green,
                ),
              ),
              title: Text(
                register.isClosed ? 'Closed Register' : 'Active Register',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('Started: ${_formatDateTime(register.start)}'),
                  if (register.end != null)
                    Text('Closed: ${_formatDateTime(register.end!)}'),
                ],
              ),
              trailing: register.isClosed
                  ? Chip(
                      label: const Text('Closed'),
                      backgroundColor: Colors.grey.shade300,
                    )
                  : const Chip(
                      label: Text('Active'),
                      backgroundColor: Colors.green,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
              isThreeLine: register.end != null,
            ),
          );
        },
      );
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy HH:mm').format(dateTime);
  }
}
