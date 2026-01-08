import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
class EmailIdpEndpoint extends EmailIdpBaseEndpoint {
  Future<UserProfile> getUserProfile(Session session) async {
    await AuthServices.instance.authUsers.update(
      session,
      authUserId: session.authenticated!.authUserId,
      scopes: {Scope.admin},
    );
    final userProfile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(session.authenticated!.authUserId),
    );
    if (userProfile == null) {
      throw Exception(
        'User profile for auth user id ${session.authenticated!.authUserId} not found',
      );
    }
    return userProfile;
  }
}
