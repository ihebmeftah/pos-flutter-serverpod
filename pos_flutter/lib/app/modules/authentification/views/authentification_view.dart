import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/routes/app_pages.dart';
import 'package:pos_flutter/app/themes/assets.dart';

import '../controllers/authentification_controller.dart';

class AuthentificationView extends GetView<AuthentificationController> {
  const AuthentificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(R.imagesJpegBg),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 0.7),
              BlendMode.modulate,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                // Logo or Icon (optional - you can replace with your app logo)
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),

                // Welcome Text
                Text(
                  'Welcome to POS',
                  style: context.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Manage your business effortlessly\nSign in to get started',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),

                // Email Login Button
                _SocialLoginButton(
                  label: 'Continue with Email',
                  icon: Icons.email_outlined,
                  backgroundColor: context.theme.primaryColor,
                  textColor: Colors.white,
                  onPressed: () => Get.toNamed(Routes.LOGIN),
                ),
                const SizedBox(height: 16),

                /*    // Google Login Button
                _SocialLoginButton(
                  label: 'Continue with Google',
                  icon: Icons.g_mobiledata,
                  backgroundColor: Colors.white,
                  textColor: Colors.black87,
                  borderColor: Colors.grey.shade300,
                  onPressed: controller.onGoogleLogin,
                ),
                const SizedBox(height: 16),

                // Facebook Login Button
                _SocialLoginButton(
                  label: 'Continue with Facebook',
                  icon: Icons.facebook,
                  backgroundColor: const Color(0xFF1877F2),
                  textColor: Colors.white,
                  onPressed: controller.onFacebookLogin,
                ),
                const SizedBox(height: 32), */

                // Terms and Privacy
                Text(
                  'By continuing, you agree to our Terms of Service\nand Privacy Policy',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.black45,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  // final Color? borderColor;
  final VoidCallback onPressed;

  const _SocialLoginButton({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    //  this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 2,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: /*borderColor != null
                ? BorderSide(color: borderColor!, width: 1)
                : */
                BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
