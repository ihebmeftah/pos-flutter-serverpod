import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
class EmailIdpEndpoint extends EmailIdpBaseEndpoint {
  Future<UserProfileModel> getUserProfile(Session session) async {
    UserProfileModel userProfile = await AuthServices.instance.userProfiles
        .findUserProfileByUserId(
          session,
          session.authenticated!.authUserId,
        );
    return userProfile;
  }
}
