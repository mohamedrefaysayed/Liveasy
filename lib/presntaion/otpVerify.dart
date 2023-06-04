// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveasy/Helper/Colors.dart';
import 'package:liveasy/Helper/MyApplication.dart';
import 'package:liveasy/Helper/widgets/submitButton.dart';
import 'package:liveasy/businesLogic/phoneFill/phone_fill_cubit.dart';
import 'package:liveasy/presntaion/selectProfile.dart';
import 'package:sms_autofill/sms_autofill.dart';

class otpVerify extends StatelessWidget {
  const otpVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myApplication.keyboardFocus(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: myApplication.widthClc(10, context),
                        top: myApplication.hightClc(40, context)),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: myApplication.hightClc(54, context),
              ),
              const Text(
                "Verify Phone",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              SizedBox(
                height: myApplication.hightClc(11, context),
              ),
              Text(
                "Code is sent to  +91${PhoneFillCubit.phoneNumber}",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(
                height: myApplication.hightClc(32, context),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: myApplication.widthClc(11, context)),
                child: PinFieldAutoFill(

                  currentCode: PhoneFillCubit.OTP,
                  decoration:  BoxLooseDecoration(
                    gapSpace: 8,
                    radius: Radius.zero,
                    bgColorBuilder: FixedColorBuilder(
                        myColors.lightblue
                    ),
                      strokeColorBuilder: FixedColorBuilder(
                          myColors.lightblue)),
                  codeLength: 6,
                  onCodeChanged: (code) {
                    if (kDebugMode) {
                      print("OnCodeChanged : $code");
                    }
                    PhoneFillCubit.OTP = code.toString();
                  },
                  onCodeSubmitted: (val) {
                    if (kDebugMode) {
                      print("OnCodeSubmitted : $val");
                    }
                  },
                ),
              ),
              SizedBox(
                height: myApplication.hightClc(16, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn’t receive the code?",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<PhoneFillCubit>(context).loginWithPhone();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Request Again",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: myApplication.hightClc(24, context),
              ),
              BlocConsumer<PhoneFillCubit, PhoneFillState>(
                listener: (context, state) {
                  if (state is PhoneFillInitial) {
                    BlocProvider.of<PhoneFillCubit>(context)
                        .listenOtp();
                  } else if (state is PhoneFillSuccess) {
                    myApplication.showToast(
                        text: "Verifyed Successfully",
                        color: myColors.darkblue);
                    myApplication.navigateToRemove(context, const selectProfile());
                  } else if (state is PhoneFillFailuer) {
                    myApplication.showToast(text: "error", color: Colors.red);
                  }
                },
                builder: (context, state) {
                  if (state is PhoneFillLoading) {
                    return Container(
                      width: myApplication.widthClc(328, context),
                      height: myApplication.hightClc(56, context),
                      color: myColors.darkblue,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return submitButton(
                        mywidth: myApplication.widthClc(328, context),
                        myhight: myApplication.hightClc(56, context),
                        text: "VERIFY AND CONTINUE",
                        ontap: () async {
                          if (kDebugMode) {
                            print("Verifyed!");
                          }
                          if (PhoneFillCubit.OTP.length == 6) {
                            BlocProvider.of<PhoneFillCubit>(context)
                                .verifyOTP();
                          } else {
                            myApplication.showToast(
                                text: "Enter The Code", color: Colors.white);
                          }
                        });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
