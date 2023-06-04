// ignore_for_file: camel_case_types, avoid_types_as_parameter_names, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveasy/Helper/Colors.dart';
import 'package:liveasy/Helper/MyApplication.dart';
import 'package:liveasy/Helper/widgets/submitButton.dart';
import 'package:liveasy/businesLogic/phoneFill/phone_fill_cubit.dart';
import 'package:liveasy/presntaion/otpVerify.dart';

class phoneFill extends StatelessWidget {
  const phoneFill({Key? key}) : super(key: key);

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
                        Icons.close,
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
                "Please enter your mobile number",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              SizedBox(
                height: myApplication.hightClc(11, context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "You’ll receive a 4 digit code",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    "to verify next",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: myApplication.hightClc(32, context),
              ),
              Container(
                width: myApplication.widthClc(327, context),
                height: myApplication.hightClc(48, context),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    )),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/india flag.png",
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "+91    -   ",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        onChanged: (num) {
                          PhoneFillCubit.phoneNumber = num;
                        },
                        decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          labelStyle: TextStyle(),
                          hintStyle: TextStyle(fontSize: 18),
                          hintText: "Mobile Number",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: myApplication.hightClc(24, context),
              ),
              BlocConsumer<PhoneFillCubit, PhoneFillState>(
                listener: (context, state) {

                  if(state is PhoneFillSuccess){
                    myApplication.showToast(text: "sent Successfully", color: myColors.darkblue);
                    myApplication.navigateToReplace(context,const otpVerify());
                    BlocProvider.of<PhoneFillCubit>(context).emit(PhoneFillInitial());
                  }else if(state is PhoneFillFailuer){
                    myApplication.showToast(text: "error", color: Colors.red);

                  }

                },
                builder: (context, state) {
                  if(state is PhoneFillLoading){
                    return Container(
                      width: myApplication.widthClc(328, context),
                      height: myApplication.hightClc(56, context),
                      color: myColors.darkblue,
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.white,),
                      ),
                    );
                  }else{
                    return submitButton(
                        mywidth: myApplication.widthClc(328, context),
                        myhight: myApplication.hightClc(56, context),
                        text: "CONTINUE",
                        ontap: () async {
                          if (kDebugMode) {
                            print("+20${PhoneFillCubit.phoneNumber}");
                          }
                          if (PhoneFillCubit.phoneNumber.length == 10) {
                            BlocProvider.of<PhoneFillCubit>(context)
                                .loginWithPhone();
                          }
                        }
                    );
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
