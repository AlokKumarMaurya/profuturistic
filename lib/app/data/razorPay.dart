import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appConstants.dart';
import 'package:profuturistic/app/data/appStorage/sharedPrefrences.dart';
import 'package:profuturistic/app/data/network/networkApiService.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class RazorPayPayment extends StatefulWidget {
 final Function onPaymentSuccess;
 final double amount;
  const RazorPayPayment({Key? key,required this.amount,required this.onPaymentSuccess}) : super(key: key);

  @override
  State<RazorPayPayment> createState() => _RazorPayPaymentState();
}

class _RazorPayPaymentState extends State<RazorPayPayment> {
  Razorpay razorpay = Razorpay();
  @override
  void initState() {
    var options = {
      'key': 'rzp_live_Xi5AQvd1r5FlMG',//live
      // 'key': 'rzp_test_NusP3qSksQNHxf', //dev
      'amount': widget.amount*100,
      'name': 'Pro Futuristic',
      'description': 'Enroll now',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact':AppPreference().getLoginData().data.mobile ,'email': AppPreference().getLoginData().data.email },
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }



  void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
    NetworkApiService().getPostApiResponse(url: AppConstants.sendPaymentSuccessResponse, body: FormData({
    "batch_id":AppPreference().getLoginData().data.batchId,
    "student_id":AppPreference().getLoginData().data.uid,
    "razorpay_payment_id":response.paymentId,
    "totalAmount":widget.amount,
    "email":AppPreference().getLoginData().data.email,
    "name":AppPreference().getLoginData().data.name
    })).then((value) {
      widget.onPaymentSuccess();
    });
    // Future.delayed(const Duration(seconds: 3)).then((value) => widget.onPaymentSuccess());
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {
        Get.back();
        Get.back();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}
