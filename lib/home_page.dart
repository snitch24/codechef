import 'package:codechef/decoration/input_field_decoration.dart';
import 'package:codechef/models/provider.dart';
import 'package:codechef/models/validators.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import 'display_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
      
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          physics: const BouncingScrollPhysics(),
          child: Consumer<DataProvider>(
              builder: (context, DataProvider dataProvider, _) {
            return Form(
      
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Lottie.asset(
                        'assets/welcome_screen.json',
                        repeat: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: '',
                          keyboardType: TextInputType.name,
                          autocorrect: false,
                          autofillHints: const [AutofillHints.name],
                          decoration: textFieldInputDecoration(
                            context,
                            hintText: 'Keshav Fatesaria',
                            labelText: 'Name',
                            prefixIcon: const Icon(FeatherIcons.user),
                          ),
                          validator: TextFieldValidator.name,
                          enableInteractiveSelection: true,
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            cut: true,
                            paste: true,
                            selectAll: true,
                          ),
                          onSaved: (String? name) {
                            dataProvider.setName = name;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: '',
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          autofillHints: const [AutofillHints.email],
                          decoration: textFieldInputDecoration(
                            context,
                            hintText: 'fatesariakeshav@gamil.com',
                            labelText: 'Mail',
                            prefixIcon: const Icon(FeatherIcons.mail),
                          ),
                          validator: TextFieldValidator.email,
                          enableInteractiveSelection: true,
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            cut: true,
                            paste: true,
                            selectAll: true,
                          ),
                          onSaved: (String? mail) {
                            dataProvider.setEmail = mail;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: '',
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          decoration: textFieldInputDecoration(
                            context,
                            hintText: '19',
                            labelText: 'Age',
                            prefixIcon: const Icon(
                              FeatherIcons.calendar,
                            ),
                          ),
                          validator: TextFieldValidator.age,
                          enableInteractiveSelection: true,
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            cut: true,
                            paste: true,
                            selectAll: true,
                          ),
                          onSaved: (String? age) {
                            dataProvider.setAge = int.tryParse(age!);
                          },
                        ),
                      ),
                      ConfirmationSlider(
                        stickToEnd: false,
                        onConfirmation: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            formKey.currentState!.reset();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const DisplayPage(),
                              ),
                            );
                          }
                        },
                        sliderButtonContent: const Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                          size: 35,
                        ),
                        textStyle: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
