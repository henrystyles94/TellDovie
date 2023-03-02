import 'dart:convert';
import 'dart:developer';
import 'package:dovie/constants/api_routes.dart';
import 'package:dovie/constants/http%20call/api_services.dart';
import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:dovie/features/subscription/repository/subscriptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentScreen extends StatefulWidget {
  final String amount;
  final String duration;
  const PaymentScreen({Key? key, required this.amount, required this.duration}) : super(key: key);

  @override
  _PaymentScreen createState() => _PaymentScreen();
}

final subScriptionController = Get.put(SubscriptionRepository());

class _PaymentScreen extends State<PaymentScreen> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Dovie Stripe Payment',
          style: AppStyles().mediumText,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                'Make Payment',
                style: AppStyles().mediumText,
              ),
              onPressed: () async {
                await makePayment();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.0.w),
              child: Divider(
                height: 10,
                thickness: 3,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent(widget.amount, 'USD');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Wellness'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 100.0,
                      ),
                      SizedBox(height: 10.0),
                      Text("Payment Successful!"),
                      CustomButton(
                          height: 50.h,
                          width: 80.w,
                          borderRadius: 10,
                          buttonText: 'ok',
                          opnPress: () {
                            Get.offAllNamed('bottomNavPage');
                          },
                          isLoading: false)
                    ],
                  ),
                ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51KqXCWL12gYZ97fKilgpmxWtDS9P9pwGvy2rbODWHap8w813VOmlpDX1AHBk7scdklwqBxe6L7fJE0rvyh5EmVwT00mPFWoV9l',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        
        subScriptionController.subscribe(widget.duration, amount);
      }
      log('${response.statusCode}');
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
}
