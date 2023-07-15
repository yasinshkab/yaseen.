import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/controller/typecontroller.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/function/dialog.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/handeldataview.dart';
import 'package:hommer_admin/view/widget/message.dart';

class TypesPage extends StatefulWidget {
  const TypesPage({super.key});

  @override
  State<TypesPage> createState() => _TypesPageState();
}

class _TypesPageState extends State<TypesPage> {
  @override
  Widget build(BuildContext context) {
    var categoryid;
    var categoryname;

    TypeAddControllerImp control = Get.put(TypeAddControllerImp());
    return Container(
        child: GetBuilder<TypeAddControllerImp>(
            builder: (controller) => Handeldataview(
                statusRequest: controller.statusRequest,
                widget: Center(
                    child: SingleChildScrollView(
                        child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),

                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          controller.name.text = "";
                        });
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) =>
                                StatefulBuilder(builder: (context, setState) {
                                  return addDialog(
                                      buttonon: () {
                                        if (controller.file!.bytes != null &&
                                            controller.formKey.currentState!
                                                .validate()) {
                                          control.adddata(
                                              controller.name.text,
                                              '${categoryid['category_id']}',
                                              controller.file);
                                          Get.back();
                                        } else {
                                          print("whaat");
                                        }
                                      },
                                      controllername: controller.name,
                                      isproduct: false,
                                      key: controller.formKey,
                                      pickimage: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform.pickFiles(
                                                type: FileType.image);
                                        if (result != null) {
                                          controller.file = result.files.first;
                                          if (controller.file!.bytes != null) {
                                            categoryid = controller.catresponse
                                                .firstWhere(
                                              (item) =>
                                                  item['category_name'] ==
                                                  controller.value,
                                            );
                                          } else {
                                            print('No data available in file');
                                          }
                                        } else {
                                          print('User canceled the picker');
                                        }
                                      },
                                      thewidget: DropdownButton(
                                        underline: Container(
                                          height: 1,
                                          color: const Color.fromRGBO(
                                              125, 125, 125, 0.75),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        isExpanded: true,
                                        value: controller.value,
                                        isDense: true,
                                        onChanged: (newValue) {
                                          setState(() {
                                            controller.value = newValue!;
                                          });
                                        },
                                        items: controller.categoryNamesList
                                            .map((String value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      125, 125, 125, 1),
                                                  fontSize: 16),
                                            ),
                                          );
                                        }).toList(),
                                      ));
                                }));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.49,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.black.withOpacity(.15),
                                spreadRadius: 0.08,
                                offset: const Offset(0, 4),
                              )
                            ],
                            color: const Color.fromRGBO(226, 33, 38, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  " اضافة نوع جديد",
                                  style: addLocation,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                  size: 36,
                                )
                              ],
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Text(
                    //   "${controller.catresponse}",
                    //   style: addLocation,
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: controller.types.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(.15),
                                      spreadRadius: 0.08,
                                      offset: const Offset(0, 4),
                                    )
                                  ],
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // textDirection: TextDirection.rtl,
                                            '${controller.types[index].typeId}',
                                            style: lastoperations,
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${controller.types[index].typeName}',
                                            style: typecategory,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          IconButton(
                                              splashRadius: 0.1,
                                              onPressed: () {
                                                setState(() {
                                                  controller.name.text =
                                                      "${controller.types[index].typeName}";
                                                  categoryname = controller
                                                      .catresponse
                                                      .firstWhere((item) =>
                                                          item['category_id'] ==
                                                          "${controller.types[index].typeCategory}");
                                                  controller.value =
                                                      '${categoryname['category_name']}';
                                                });
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) =>
                                                        StatefulBuilder(builder:
                                                            (context,
                                                                setState) {
                                                          return addDialog(
                                                              buttonon:
                                                                  () async {
                                                                if (controller
                                                                    .formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  categoryid =
                                                                      controller
                                                                          .catresponse
                                                                          .firstWhere(
                                                                    (item) =>
                                                                        item[
                                                                            'category_name'] ==
                                                                        controller
                                                                            .value,
                                                                  );
                                                                  if (controller
                                                                          .file
                                                                          ?.bytes !=
                                                                      null) {
                                                                    controller.editdata(
                                                                        "${controller.types[index].typeId}",
                                                                        "${controller.types[index].typeImage}",
                                                                        controller
                                                                            .name
                                                                            .text,
                                                                        '${categoryid['category_id']}',
                                                                        controller
                                                                            .file);
                                                                  } else {
                                                                    controller
                                                                        .editDataWithouttheFile(
                                                                      "${controller.types[index].typeId}",
                                                                      "${controller.types[index].typeImage}",
                                                                      controller
                                                                          .name
                                                                          .text,
                                                                      '${categoryid['category_id']}',
                                                                    );
                                                                  }
                                                                  Get.back();
                                                                }
                                                              },
                                                              controllername:
                                                                  controller
                                                                      .name,
                                                              isproduct: false,
                                                              key: controller
                                                                  .formKey,
                                                              pickimage:
                                                                  () async {
                                                                FilePickerResult?
                                                                    result =
                                                                    await FilePicker
                                                                        .platform
                                                                        .pickFiles(
                                                                            type:
                                                                                FileType.image);
                                                                if (result !=
                                                                    null) {
                                                                  controller
                                                                          .file =
                                                                      result
                                                                          .files
                                                                          .first;
                                                                  if (controller
                                                                          .file!
                                                                          .bytes !=
                                                                      null) {
                                                                  } else {
                                                                    print(
                                                                        'No data available in file');
                                                                  }
                                                                } else {
                                                                  print(
                                                                      'User canceled the picker');
                                                                }
                                                              },
                                                              thewidget:
                                                                  DropdownButton(
                                                                underline:
                                                                    Container(
                                                                  height: 1,
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      125,
                                                                      125,
                                                                      125,
                                                                      0.75),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                isExpanded:
                                                                    true,
                                                                value:
                                                                    controller
                                                                        .value,
                                                                isDense: true,
                                                                onChanged:
                                                                    (newValue) {
                                                                  setState(() {
                                                                    controller
                                                                            .value =
                                                                        newValue!;
                                                                  });
                                                                },
                                                                items: controller
                                                                    .categoryNamesList
                                                                    .map((String
                                                                        value) {
                                                                  return DropdownMenuItem(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                      value,
                                                                      style: const TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color: Color.fromRGBO(
                                                                              125,
                                                                              125,
                                                                              125,
                                                                              1),
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                  );
                                                                }).toList(),
                                                              ));
                                                        }));
                                              },
                                              icon: const Icon(Icons.edit)),
                                          const Spacer(),
                                          IconButton(
                                              splashRadius: 0.1,
                                              onPressed: () {
                                                deleteDialog(
                                                    title: "تنبيه",
                                                    middleText:
                                                        "هل أنت متأكد من أنك تريد أن تحدف هذا النوع",
                                                    onPressed: () {
                                                      control.deletedata(
                                                          "${controller.types[index].typeId}",
                                                          "${controller.types[index].typeImage}");
                                                    });
                                              },
                                              icon: const Icon(Icons.delete)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ]),
                ))))));
  }
}
  // if (controller
  //                                                                 .name.text ==
  //                                                             '') {
  //                                                           controller
  //                                                                   .name.text =
  //                                                               "${controller.types[index].typeName}";
  //                                                         } else {
  //                                                           null;
  //                                                         }