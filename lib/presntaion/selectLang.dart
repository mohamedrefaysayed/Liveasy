// ignore_for_file: non_constant_identifier_names, camel_case_types, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveasy/Helper/Colors.dart';
import 'package:liveasy/Helper/MyApplication.dart';
import 'package:liveasy/Helper/widgets/submitButton.dart';
import 'package:liveasy/Helper/widgets/waveClipPath1.dart';
import 'package:liveasy/Helper/widgets/waveClipPath2.dart';
import 'package:liveasy/businesLogic/langs/langs_cubit.dart';
import 'package:liveasy/presntaion/phoneFill.dart';

class selectLang extends StatelessWidget {
  selectLang({Key? key}) : super(key: key);

  final List<String> Langs = ["English"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: myApplication.hightClc(111, context),
            ),
            const Icon(
              Icons.photo,
              size: 60,
            ),
            SizedBox(
              height: myApplication.hightClc(42, context),
            ),
            const Text(
              "Please Select Your Language",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: myApplication.hightClc(11, context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "You Can Change The Language",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "at any Time",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: myApplication.hightClc(25, context),
            ),
            BlocBuilder<LangsCubit, LangsState>(
              builder: (context, state) {
                return DropdownButtonHideUnderline(
                    child: DropdownButton2(
                  onChanged: (val) {
                    LangsCubit.selectedlang = val!;
                    BlocProvider.of<LangsCubit>(context)
                        .emit(LangsInitial());
                  },
                  value: LangsCubit.selectedlang,
                  items: Langs.map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )).toList(),
                  buttonStyleData: ButtonStyleData(
                    height: myApplication.hightClc(47, context),
                    width: myApplication.widthClc(215, context),
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.5,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    elevation: 0,
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      size: myApplication.widthClc(25, context),
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                      maxHeight: myApplication.hightClc(200, context),
                      width: myApplication.widthClc(120, context),
                      padding: null,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      elevation: 8,
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      )),
                  menuItemStyleData: MenuItemStyleData(
                    height: myApplication.hightClc(40, context),
                    padding: const EdgeInsets.only(left: 14, right: 14),
                  ),
                ));
              },
            ),
            SizedBox(
              height: myApplication.hightClc(25, context),
            ),
            submitButton(
              mywidth: myApplication.widthClc(215, context),
              myhight: myApplication.hightClc(48, context),
              text: "NEXT", ontap: (){myApplication.navigateTo(const phoneFill(), context);},
            ),
            const Spacer(),
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    color: myColors.lightblue,
                    height: myApplication.hightClc(100, context),
                    width: double.infinity,
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    color: myColors.darkblue.withOpacity(0.5),
                    height: myApplication.hightClc(100, context),
                    width: double.infinity,                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
