// ignore_for_file: avoid_print

import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:pos_server/src/generated/protocol.dart';
import 'package:pos_server/src/generated/endpoints.dart';
import 'package:pos_server/src/helpers/database_seeder.dart';

/// Standalone script to seed the database with initial data
///
/// Usage:
///   dart run bin/seed_database.dart --config=development
///
/// This will create:
/// - 3 cafe owner accounts
/// - 3 buildings with different configurations
/// - Access permissions (Manager, Waiter, Chef)
/// - Employers for each building
/// - Ingredients
/// - 5 Categories per building
/// - 3 Articles per category with compositions
void main(List<String> args) async {
  // Initialize Serverpod with the protocol
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // Initialize authentication services
  pod.initializeAuthServices(
    authUsersConfig: AuthUsersConfig(),
    tokenManagerBuilders: [
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      EmailIdpConfigFromPasswords(
        sendRegistrationVerificationCode:
            (
              session, {
              required email,
              required accountRequestId,
              required verificationCode,
              required transaction,
            }) {
              // For seeding, we don't need to send emails
              session.log('Verification code for $email: $verificationCode');
            },
        sendPasswordResetVerificationCode:
            (
              session, {
              required email,
              required passwordResetRequestId,
              required verificationCode,
              required transaction,
            }) {
              // For seeding, we don't need to send emails
              session.log('Password reset code for $email: $verificationCode');
            },
      ),
    ],
  );

  try {
    print('🌱 Starting database initialization...');
    print('');

    // Create a session to interact with the database
    await pod.createSession(enableLogging: false).then((session) async {
      try {
        await DatabaseSeeder.seed(session);
      } finally {
        await session.close();
      }
    });

    print('');
    print('✅ Database seeding completed successfully!');
    print('');
    print('📝 Summary:');
    print('   - 3 Owner Accounts');
    print('   - 3 Buildings with Different Configurations');
    print('   - 9 Access Permission Roles (3 per building)');
    print('   - 9 Employers (3 per building)');
    print('   - 30 Ingredients (10 per building)');
    print('   - 15 Categories (5 per building)');
    print('   - 45 Articles (3 per category)');
    print('   - ~90 Article Compositions');
    print('');
    print('🔑 Owner Login Credentials:');
    print('   Email: owner1@cafedream.com');
    print('   Password: Owner123!');
    print('');
    print('   Email: owner2@tuniscafe.tn');
    print('   Password: Owner123!');
    print('');
    print('   Email: owner3@bistroparis.fr');
    print('   Password: Owner123!');
    print('');
    print('💡 Employee Password: Employee123!');
  } catch (e, stackTrace) {
    print('❌ Error during database seeding:');
    print(e);
    print('');
    print('Stack trace:');
    print(stackTrace);
    exit(1);
  } finally {
    // Cleanup
    await pod.shutdown(exitProcess: false);
    exit(0);
  }
}
