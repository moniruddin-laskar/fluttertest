import 'package:flutter/material.dart';
import 'package:fluttertest/const/colors.dart';
import 'package:fluttertest/html_textfield/html_textfield.dart';

import '../../../const/app_images.dart';
import '../../../widgets/common_widgets.dart';

class BookAppointmentSecondScreen extends StatefulWidget {
  const BookAppointmentSecondScreen({super.key});

  @override
  State<BookAppointmentSecondScreen> createState() =>
      _BookAppointmentSecondScreenState();
}

class _BookAppointmentSecondScreenState
    extends State<BookAppointmentSecondScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();
  TextEditingController testController = TextEditingController();
  TextEditingController htmlEditorController1 = TextEditingController();
  TextEditingController htmlEditorController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: appColor,
        leading: IconButton(
          icon: Image.asset(AppImages.leftArrow,
              color: white, height: 20, width: 20),
          onPressed: () {
            goBack(context);
          },
        ),
        centerTitle: true,
        title: textSemiBold(
            color: white, maxLine: 1, size: 14, text: "Book an Appointment"),
        actions: [
          GestureDetector(
            onTap: () async {
              print("save");
              print(htmlEditorController1.text.toString());
              print(htmlEditorController2.text.toString());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: textSemiBold(
                  color: loginButtonColorTwo,
                  maxLine: 1,
                  size: 14,
                  text: "Save",
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // TypeAheadField<CustomerDetailsInDailyCustomer>(
                //   // direction: settings.direction.value,
                //   controller: searchController,
                //   builder: (context, controller, focusNode) => TextField(
                //     controller: controller,
                //     focusNode: focusNode,
                //     // autofocus: true,

                //     style: DefaultTextStyle.of(context)
                //         .style
                //         .copyWith(fontStyle: FontStyle.italic),

                //     decoration: InputDecoration(
                //       contentPadding: EdgeInsets.all(10),
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //           borderSide: BorderSide.none),
                //       filled: true,
                //       fillColor: textInputBoxColor,
                //       hintText: "Search for customer!",
                //     ),
                //   ),
                //   decorationBuilder: (context, child) => Material(
                //     type: MaterialType.card,
                //     elevation: 4,
                //     borderRadius: BorderRadius.circular(10),
                //     child: child,
                //   ),
                //   itemBuilder: (context, product) => ListTile(
                //     title: Text(product.name.toString()),
                //   ),
                //   onSelected: (CustomerDetailsInDailyCustomer value) {
                //     searchController.text = value.name.toString();
                //     appointmentControllerInstance
                //         .createAppointmentCustomerId
                //         .value = value.cId!.toInt();
                //     appointmentControllerInstance
                //         .createCustomerNameController
                //         .text = value.name.toString();
                //     appointmentControllerInstance
                //         .createPrimaryNameController
                //         .text = value.primaryContactName.toString();
                //     appointmentControllerInstance.createPhoneController
                //         .text = value.mobile.toString();
                //     appointmentControllerInstance
                //         .createAlternateNameController
                //         .text = value.alternateName.toString();
                //     appointmentControllerInstance
                //         .createAlternatePhoneController
                //         .text = value.alternateMobile.toString();
                //     appointmentControllerInstance
                //         .createAddressLineController
                //         .text = value.address.toString();
                //     appointmentControllerInstance.createCustoNotesController
                //         .text = value.customerNotes.toString();
                //   },
                //   suggestionsCallback: (String search) {
                //     return appointmentControllerInstance
                //         .getDailyCustomers(search);
                //   },
                //   // debounceDuration: debounceDuration,
                //   // hideOnSelect: settings.hideOnSelect.value,
                //   // hideOnUnfocus: settings.hideOnUnfocus.value,
                //   // hideWithKeyboard: settings.hideOnUnfocus.value,
                //   // retainOnLoading: settings.retainOnLoading.value,
                //   // onSelected: onSuggestionSelected,
                //   // suggestionsCallback: suggestionsCallback,
                //   // itemSeparatorBuilder: itemSeparatorBuilder,
                //   // listBuilder:
                //   //     settings.gridLayout.value ? gridLayoutBuilder : null,
                // ),

                vSpace(20),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 300,
                    width: fullWidth(context) * 0.95,
                    child: HtmlTextField(
                      minHeight: 300,
                      backgroundColor: grey,
                      editorTextStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                      hintText: "Description",
                      hintTextStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                      toolbarColor: blue,
                      toolbarIconColor: white,
                      toolbarActiveIconColor: red,
                      toolbarIconSize: 20.0,
                      textController: htmlEditorController1,
                    ),
                  ),
                ),
                vSpace(20),
                SizedBox(
                  height: 300,
                  width: fullWidth(context) * 0.95,
                  child: HtmlTextField(
                    textController: htmlEditorController2,
                    minHeight: 300,
                    backgroundColor: grey,
                    editorTextStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                    hintText: "Description",
                    hintTextStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                    toolbarColor: blue,
                    toolbarIconColor: white,
                    toolbarActiveIconColor: red,
                    toolbarIconSize: 20.0,
                  ),
                ),
                vSpace(20),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: testController,
                  keyboardType: TextInputType.name,
                  cursorColor: loginButtonColorOne,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: textInputBoxColor,
                      errorBorder: customOutlineBorder(),
                      hintText: "Name",
                      errorMaxLines: 1,
                      hintStyle: TextStyle(
                          color: hintTextColor,
                          fontSize: 13,
                          fontFamily: "WorkSans")),
                ),
                vSpace(20),
                Row(
                  children: [
                    textSemiBold(
                      text: "Primary Contact",
                      size: 14,
                      color: loginFormTextColor,
                    ),
                  ],
                ),
                vSpace(5),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: testController,
                  keyboardType: TextInputType.name,
                  cursorColor: loginButtonColorOne,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: textInputBoxColor,
                      errorBorder: customOutlineBorder(),
                      hintText: "Name",
                      errorMaxLines: 1,
                      hintStyle: TextStyle(
                          color: hintTextColor,
                          fontSize: 13,
                          fontFamily: "WorkSans")),
                ),
                vSpace(10),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: testController,
                  keyboardType: TextInputType.phone,
                  // focusNode: focusNode,
                  cursorColor: loginButtonColorOne,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: textInputBoxColor,
                      errorBorder: customOutlineBorder(),
                      hintText: "Phone #",
                      errorMaxLines: 1,
                      hintStyle: TextStyle(
                          color: hintTextColor,
                          fontSize: 13,
                          fontFamily: "WorkSans")),
                ),
                vSpace(20),
                Row(
                  children: [
                    textSemiBold(
                      text: "Alternative Contact",
                      size: 14,
                      color: loginFormTextColor,
                    ),
                  ],
                ),
                vSpace(5),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: testController,
                  keyboardType: TextInputType.name,
                  cursorColor: loginButtonColorOne,
                  // focusNode: focusNode,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: textInputBoxColor,
                      errorBorder: customOutlineBorder(),
                      hintText: "Name",
                      errorMaxLines: 1,
                      hintStyle: TextStyle(
                          color: hintTextColor,
                          fontSize: 13,
                          fontFamily: "WorkSans")),
                ),
                vSpace(10),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: testController,
                  keyboardType: TextInputType.phone,
                  // focusNode: focusNode,
                  cursorColor: loginButtonColorOne,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: textInputBoxColor,
                      errorBorder: customOutlineBorder(),
                      hintText: "Phone #",
                      errorMaxLines: 1,
                      hintStyle: TextStyle(
                          color: hintTextColor,
                          fontSize: 13,
                          fontFamily: "WorkSans")),
                ),
                vSpace(20),
                Row(
                  children: [
                    textSemiBold(
                      text: "Address",
                      size: 14,
                      color: loginFormTextColor,
                    ),
                  ],
                ),
                vSpace(5),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: testController,
                  keyboardType: TextInputType.streetAddress,
                  cursorColor: loginButtonColorOne,
                  // focusNode: focusNode,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: textInputBoxColor,
                      errorBorder: customOutlineBorder(),
                      hintText: "Address line ",
                      errorMaxLines: 1,
                      hintStyle: TextStyle(
                          color: hintTextColor,
                          fontSize: 13,
                          fontFamily: "WorkSans")),
                ),
                vSpace(20),
                Row(
                  children: [
                    textSemiBold(
                      text: "Custom Notes",
                      size: 14,
                      color: loginFormTextColor,
                    ),
                  ],
                ),
                vSpace(5),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: testController,
                  keyboardType: TextInputType.multiline,
                  cursorColor: loginButtonColorOne,
                  // focusNode: focusNode,

                  maxLines: 3,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: textInputBoxColor,
                      errorBorder: customOutlineBorder(),
                      hintText: "Type here...",
                      errorMaxLines: 1,
                      hintStyle: TextStyle(
                          color: hintTextColor,
                          fontSize: 13,
                          fontFamily: "WorkSans")),
                ),
                vSpace(20),
                Row(
                  children: [
                    textSemiBold(
                      text: "Install Notes",
                      size: 14,
                      color: loginFormTextColor,
                    ),
                  ],
                ),
                vSpace(5),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: testController,
                  keyboardType: TextInputType.multiline,
                  // focusNode: focusNode,
                  maxLines: 3,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: textInputBoxColor,
                      errorBorder: customOutlineBorder(),
                      hintText: "Type here...",
                      errorMaxLines: 1,
                      hintStyle: TextStyle(
                          color: hintTextColor,
                          fontSize: 13,
                          fontFamily: "WorkSans")),
                ),
                vSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
