import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/Helper/Colors.dart';
import 'package:liveasy/Helper/MyApplication.dart';
import 'package:meta/meta.dart';
import 'package:sms_autofill/sms_autofill.dart';

part 'phone_fill_state.dart';

class PhoneFillCubit extends Cubit<PhoneFillState> {
  PhoneFillCubit() : super(PhoneFillInitial());
  static String phoneNumber = "+91";
  static String OTP = "";

  User? user;

  String verificationID = "";

  FirebaseAuth auth = FirebaseAuth.instance;


  void loginWithPhone() async {
    emit(PhoneFillLoading());

    auth.verifyPhoneNumber(
      phoneNumber: "+91" + phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        emit(PhoneFillFailuer());
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
        emit(PhoneFillSuccess());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {

    emit(PhoneFillLoading());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: OTP);

    await auth.signInWithCredential(credential).then(
          (value) {
          user = FirebaseAuth.instance.currentUser;
          emit(PhoneFillInitial());
      },
    ).whenComplete(
          () {
        if (user != null) {
          emit(PhoneFillSuccess());
          listenOtpDispose();
          myApplication.showToast(text: "You are logged in successfully", color: myColors.darkblue);
        } else {
          emit(PhoneFillFailuer());

          myApplication.showToast(text: "your login is failed", color: Colors.red);
        }
      },
    );
  }
  listenOtp() async {
    await SmsAutoFill().listenForCode();
    print("OTP Listen is called");
  }

  listenOtpDispose() {
    SmsAutoFill().unregisterListener();
    print("Unregistered Listener");
  }
}
