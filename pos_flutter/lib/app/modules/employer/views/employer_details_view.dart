import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /*             /// Profile Card
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      /// Header with gradient background
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppTheme().primary,
                              AppTheme().primary.withValues(alpha: 0.7),
                            ],
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      ),

                      /// Profile Avatar (overlapping)
                      Transform.translate(
                        offset: const Offset(0, -50),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.15),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: AppTheme().primary,
                                foregroundColor: Colors.white,
                                child: Text(
                                  '${employer.userProfile!.fullName![0].toUpperCase()}}',
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            /// Name
                            Text(
                              '${employer.userProfile!.fullName}',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            if (employer.userProfile!.userName != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                '@${employer.userProfile!.userName}',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: AppTheme().primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                            const SizedBox(height: 8),
                            // Role Badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme().primary.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "${employer.userProfile!.authUser!.scopeNames.join(', ').toUpperCase()} - ${employer.access?.name != null ? employer.access!.name.toUpperCase() : "No Access"}",
                                style: Theme.of(context).textTheme.labelMedium
                                    ?.copyWith(
                                      color: AppTheme().primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Contact Information Card
                */
                // Account Information Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: AppTheme().primary,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Account Information',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                      _buildInfoRow(
                        context,
                        icon: Icons.vpn_key_outlined,
                        label: 'Access',
                        value: (employer.access?.name ?? 'No Access Assigned'),
                      ),
                      const Divider(height: 32),
                      _buildInfoRow(
                        context,
                        icon: Icons.pin_outlined,
                        label: 'Employer ID',
                        value: (employer.id ?? 'N/A').toString(),
                      ),
                      const Divider(height: 32),
                      _buildInfoRow(
                        context,
                        icon: Icons.pin_outlined,
                        label: 'Profile ID',
                        value: (employer.userProfileId).toString(),
                      ),
                      const Divider(height: 32),
                      _buildInfoRow(
                        context,
                        icon: Icons.pin_outlined,
                        label: 'Auth User ID',
                        value: (employer.userProfile!.authUserId).toString(),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: AppTheme().primary,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Contact Information',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                      if (employer.building != null) ...[
                        const Divider(height: 32),
                        _buildInfoRow(
                          context,
                          icon: Icons.business,
                          label: 'Building',
                          value: employer.building!.name,
                        ),
                      ],
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
