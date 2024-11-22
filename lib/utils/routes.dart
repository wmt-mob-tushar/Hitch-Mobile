import 'package:flutter/material.dart';
import 'package:hitech_mobile/screens/non_auth/login/login.dart';
import 'package:hitech_mobile/screens/non_auth/login/login_register_screen.dart';
import 'package:hitech_mobile/screens/splash/splash.dart';

class Routes {
  // Route names
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String deviceList = '/device-list';
  static const String deviceDetails = '/device-details';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String wallet = '/wallet';
  static const String bankDetails = '/bank-details';
  static const String addBank = '/add-bank';
  static const String changePassword = '/change-password';
  static const String scanQR = '/scan-qr';
  static const String verifyBank = '/verify-bank';
  static const String otpVerification = '/otp-verification';

  // Route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRoute(const Splash());

      case login:
        return _buildRoute(const LoginScreen());

      // case register:
      //   return _buildRoute(const RegisterScreen());
      //
      // case home:
      //   return _buildRoute(const HomeScreen());
      //
      // case deviceList:
      //   return _buildRoute(const DeviceListScreen());
      //
      // case deviceDetails:
      //   final args = settings.arguments as Map<String, dynamic>?;
      //   return _buildRoute(DeviceDetailsScreen(deviceId: args?['deviceId']));
      //
      // case profile:
      //   return _buildRoute(const ProfileScreen());
      //
      // case editProfile:
      //   return _buildRoute(const EditProfileScreen());
      //
      // case wallet:
      //   return _buildRoute(const WalletScreen());
      //
      // case bankDetails:
      //   return _buildRoute(const BankDetailsScreen());
      //
      // case addBank:
      //   return _buildRoute(const AddBankScreen());
      //
      // case changePassword:
      //   return _buildRoute(const ChangePasswordScreen());
      //
      // case scanQR:
      //   return _buildRoute(const QRScannerScreen());
      //
      // case verifyBank:
      //   final args = settings.arguments as Map<String, dynamic>?;
      //   return _buildRoute(VerifyBankScreen(bankData: args?['bankData']));
      //
      // case otpVerification:
      //   final args = settings.arguments as Map<String, dynamic>?;
      //   return _buildRoute(OTPVerificationScreen(
      //     email: args?['email'],
      //     purpose: args?['purpose'],
      //   ));
      //
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  // Helper method to build routes with transitions
  static MaterialPageRoute _buildRoute(Widget screen,
      {bool fullscreenDialog = false}) {
    return MaterialPageRoute(
      builder: (_) => screen,
      fullscreenDialog: fullscreenDialog,
    );
  }

  // Custom route transitions
  static PageRouteBuilder _buildPageRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  // Modal route
  static MaterialPageRoute _buildModalRoute(Widget screen) {
    return MaterialPageRoute(
      builder: (_) => screen,
      fullscreenDialog: true,
    );
  }

  // Bottom sheet route
  static MaterialPageRoute _buildBottomSheetRoute(Widget screen) {
    return MaterialPageRoute(
      builder: (_) => screen,
      fullscreenDialog: true,
    );
  }
}

// Route arguments classes
class DeviceDetailsArguments {
  final String deviceId;
  final String? deviceName;

  DeviceDetailsArguments({required this.deviceId, this.deviceName});
}

class BankVerificationArguments {
  final String bankId;
  final String bankName;

  BankVerificationArguments({required this.bankId, required this.bankName});
}

// Usage example:
// NavigationService.instance.navigateTo(
//   Routes.deviceDetails,
//   arguments: DeviceDetailsArguments(deviceId: '123', deviceName: 'iPad Pro'),
// );
