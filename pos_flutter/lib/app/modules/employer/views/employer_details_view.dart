import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/components/app_section_card.dart';
import 'package:pos_flutter/app/components/appbottomsheet.dart';
import 'package:pos_flutter/app/modules/access/controllers/access_controller.dart';

import '../../../components/appemptyscreen.dart';
import '../../../components/apperrorscreen.dart';
import '../../../themes/apptheme.dart';
import '../controllers/employer_details_controller.dart';

class EmployerDetailsView extends GetView<EmployerDetailsController> {
  const EmployerDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employer Details'), centerTitle: true),
      body: controller.obx(
        (state) {
          final employer = controller.employer!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: .stretch,
              children: [
                // Account Information Card
                AppSectionCard(
                  title: 'Account Information',
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      _buildInfoRow(
                        context,
                        icon: Icons.person_outline,
                        label: 'Full Name',
                        value: (employer.userProfile!.fullName).toString(),
                      ),
                      const Divider(height: 32),
                      _buildInfoRow(
                        context,
                        icon: Icons.badge_outlined,
                        label: 'Roles',
                        value:
                            (employer.userProfile!.authUser!.scopeNames
                                    .join(', ')
                                    .toUpperCase())
                                .toString(),
                      ),
                      const Divider(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: GetBuilder<EmployerDetailsController>(
                              id: "update-access",
                              builder: (_) {
                                return _buildInfoRow(
                                  context,
                                  icon: Icons.vpn_key_outlined,
                                  label: 'Access',
                                  value:
                                      (employer.access?.name ??
                                      'No Access Assigned'),
                                );
                              },
                            ),
                          ),
                          TextButton(
                            onPressed: () => bottomSheet(
                              children: [
                                Expanded(
                                  child: GetBuilder<AccessController>(
                                    init: AccessController(),
                                    builder: (accessCtr) {
                                      return ListView.builder(
                                        itemCount: accessCtr.access.length,
                                        itemBuilder: (context, index) {
                                          final access =
                                              accessCtr.access[index];
                                          return ListTile(
                                            title: Text(access.name),
                                            onTap: () =>
                                                controller.updateEmployerAccess(
                                                  access.id!,
                                                ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            child: Text("Change Access"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                AppSectionCard(
                  title: 'Contact Information',
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      _buildInfoRow(
                        context,
                        icon: Icons.email,
                        label: 'Email',
                        value: employer.userProfile!.email!,
                      ),
                      const Divider(height: 32),
                      _buildInfoRow(
                        context,
                        icon: Icons.phone,
                        label: 'Phone',
                        value: "--",
                      ),
                      const Divider(height: 32),
                      _buildInfoRow(
                        context,
                        icon: Icons.business,
                        label: 'Building',
                        value: employer.building!.name,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: Appemptyscreen(),
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: .start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme().primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: AppTheme().primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
