import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/controller/products_control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/function/dialog.dart';
import 'package:hommer_admin/core/handeldataview.dart';
import 'package:hommer_admin/view/widget/message.dart';
import 'package:hommer_admin/view/widget/the_buttons.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    ProductsControllerImp control = Get.put(ProductsControllerImp());
    var typeId;
    var typename;

    return GetBuilder<ProductsControllerImp>(
        builder: (controller) => Handeldataview(
            statusRequest: controller.statusRequest,
            widget: Container(
                child: Center(
                    child: SingleChildScrollView(
                        child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                addbutton(
                  ontap: () async {
                    setState(() {
                      controller.name.text = "";
                      controller.productcode.text = "";
                      controller.productcount.text = "";
                      controller.productdiscount.text = "";
                      controller.productprice.text = "";
                    });
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) =>
                            StatefulBuilder(builder: (context, setState) {
                              return addDialog(
                                  controllerdiscount:
                                      controller.productdiscount,
                                  controllercode: controller.productcode,
                                  controllerprice: controller.productprice,
                                  controllercount: controller.productcount,
                                  buttonon: () {
                                    if (controller.file!.bytes != null &&
                                        controller.formKey.currentState!
                                            .validate()) {
                                      controller.adddata('${typeId['type_id']}',
                                          controller.file);
                                      Get.back();
                                    } else {
                                      print("whaat");
                                    }
                                  },
                                  controllername: controller.name,
                                  isproduct: true,
                                  key: controller.formKey,
                                  pickimage: () async {
                                    FilePickerResult? result = await FilePicker
                                        .platform
                                        .pickFiles(type: FileType.image);
                                    if (result != null) {
                                      controller.file = result.files.first;
                                      if (controller.file!.bytes != null) {
                                        typeId =
                                            controller.responsedata.firstWhere(
                                          (item) =>
                                              item['type_name'] ==
                                              controller.value,
                                        );
                                      } else {
                                        print('No data available in file');
                                      }
                                    } else {
                                      print('User canceled the picker');
                                    }
                                  },
                                  thewidget: Column(
                                    children: [
                                      DropdownButton(
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
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                    ],
                                  ));
                            }));
                  },
                  context: context,
                  isproduct: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
                          child: Container(
                            height: 136,
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
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${ApiLinks.productimages}/${controller.products[index].productImage}",
                                      ),
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "الإسم:",
                                                        style: productCode,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        // textDirection: TextDirection.rtl,
                                                        '${controller.products[index].productName}',
                                                        style: thesubTitle,
                                                      ),
                                                    ]),
                                                const Spacer(),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "السعر:",
                                                      style: productCode,
                                                    ),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      '${controller.products[index].productPrice}',
                                                      style: drawersub,
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "الكمية:",
                                                      style: productCode,
                                                    ),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      '${controller.products[index].productCount}',
                                                      style: drawersub,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                    splashRadius: 0.1,
                                                    onPressed: () {
                                                      setState(() {
                                                        typename = controller
                                                            .responsedata
                                                            .firstWhere((item) =>
                                                                item[
                                                                    'type_id'] ==
                                                                "${controller.products[index].productType}");
                                                        controller.value =
                                                            '${typename['type_name']}';
                                                        controller.name.text =
                                                            "${controller.products[index].productName}";
                                                        controller.productcode
                                                                .text =
                                                            "${controller.products[index].productCode}";
                                                        controller.productcount
                                                                .text =
                                                            "${controller.products[index].productCount}";
                                                        controller.productprice
                                                                .text =
                                                            "${controller.products[index].productPrice}";
                                                        controller
                                                                .productdiscount
                                                                .text =
                                                            '${controller.products[index].productDiscount}';
                                                      });
                                                      showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder: (context) =>
                                                              StatefulBuilder(
                                                                  builder: (context,
                                                                      setState) {
                                                                return addDialog(
                                                                    controllerdiscount:
                                                                        controller
                                                                            .productdiscount,
                                                                    controllercode:
                                                                        controller
                                                                            .productcode,
                                                                    controllerprice:
                                                                        controller
                                                                            .productprice,
                                                                    controllercount:
                                                                        controller
                                                                            .productcount,
                                                                    buttonon:
                                                                        () {
                                                                      if (controller.file!.bytes !=
                                                                              null &&
                                                                          controller
                                                                              .formKey
                                                                              .currentState!
                                                                              .validate()) {
                                                                        controller.editdata(
                                                                            '${typeId['type_id']}',
                                                                            "${controller.products[index].productId}",
                                                                            "${controller.products[index].productImage}",
                                                                            controller.file);
                                                                        Get.back();
                                                                      } else {
                                                                        print(
                                                                            "whaat");
                                                                      }
                                                                    },
                                                                    controllername:
                                                                        controller
                                                                            .name,
                                                                    isproduct:
                                                                        true,
                                                                    key: controller
                                                                        .formKey,
                                                                    pickimage:
                                                                        () async {
                                                                      var formdata = controller
                                                                          .formKey
                                                                          .currentState;
                                                                      if (formdata!
                                                                          .validate()) {
                                                                        FilePickerResult?
                                                                            result =
                                                                            await FilePicker.platform.pickFiles(
                                                                                type: FileType.custom,
                                                                                allowedExtensions: [
                                                                              "svg",
                                                                              "png",
                                                                              "PNG",
                                                                              "jpg",
                                                                              "jpeg"
                                                                            ]);
                                                                        if (result !=
                                                                            null) {
                                                                          controller.file = result
                                                                              .files
                                                                              .first;
                                                                          // File(result.files.single.path);

                                                                          if (controller.file!.bytes !=
                                                                              null) {
                                                                            typeId =
                                                                                controller.responsedata.firstWhere(
                                                                              (item) => item['type_name'] == controller.value,
                                                                            );
                                                                          } else {
                                                                            print('No data available in file');
                                                                          }
                                                                        } else {
                                                                          print(
                                                                              'User canceled the picker');
                                                                        }
                                                                      }

                                                                      Get.back();
                                                                    },
                                                                    thewidget:
                                                                        Column(
                                                                      children: [
                                                                        DropdownButton(
                                                                          underline:
                                                                              Container(
                                                                            height:
                                                                                1,
                                                                            color: const Color.fromRGBO(
                                                                                125,
                                                                                125,
                                                                                125,
                                                                                0.75),
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          isExpanded:
                                                                              true,
                                                                          value:
                                                                              controller.value,
                                                                          isDense:
                                                                              true,
                                                                          onChanged:
                                                                              (newValue) {
                                                                            setState(() {
                                                                              controller.value = newValue!;
                                                                            });
                                                                          },
                                                                          items: controller
                                                                              .categoryNamesList
                                                                              .map((String value) {
                                                                            return DropdownMenuItem(
                                                                              value: value,
                                                                              child: Text(
                                                                                value,
                                                                                style: const TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(125, 125, 125, 1), fontSize: 16),
                                                                              ),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              6,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "حدد الحالة :",
                                                                              style: orderheads,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        DropdownButton(
                                                                          underline:
                                                                              Container(
                                                                            height:
                                                                                1,
                                                                            color: const Color.fromRGBO(
                                                                                125,
                                                                                125,
                                                                                125,
                                                                                0.75),
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          isExpanded:
                                                                              true,
                                                                          value:
                                                                              controller.selectedWM,
                                                                          isDense:
                                                                              true,
                                                                          onChanged:
                                                                              (Value) {
                                                                            setState(() {
                                                                              print('//////////////////////');

                                                                              controller.selectedWM = "$Value";
                                                                              controller.active = controller.machine["$Value"];
                                                                              print('//////${controller.active}///////');
                                                                            });
                                                                          },
                                                                          items: controller
                                                                              .machine
                                                                              .keys
                                                                              .map((country) {
                                                                            return DropdownMenuItem(
                                                                              value: country,
                                                                              child: Text(
                                                                                country,
                                                                                style: const TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(125, 125, 125, 1), fontSize: 16),
                                                                              ),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ],
                                                                    ));
                                                              }));
                                                    },
                                                    icon:
                                                        const Icon(Icons.edit)),
                                                const Spacer(),
                                                IconButton(
                                                    splashRadius: 0.1,
                                                    onPressed: () {
                                                      deleteDialog(
                                                          title: "تنبيه",
                                                          middleText:
                                                              "هل أنت متأكد من أنك تريد أن تحدف هذا المنتج",
                                                          onPressed: () {
                                                            controller.deletedata(
                                                                "${controller.products[index].productId}",
                                                                "${controller.products[index].productImage}");
                                                          });
                                                    },
                                                    icon: const Icon(
                                                        Icons.delete)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
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
