import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/controller/editonapp/slider.control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/function/dialog.dart';
import 'package:hommer_admin/core/handeldataview.dart';
import 'package:hommer_admin/view/widget/the_buttons.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    SliderControllerImp control = Get.put(SliderControllerImp());

    return GetBuilder<SliderControllerImp>(
        builder: (controller) => Handeldataview(
            statusRequest: controller.statusRequest,
            widget: Container(
                child: Center(
                    child: SingleChildScrollView(
                        child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                slideraddbutton(
                  ontap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(type: FileType.image);
                    if (result != null) {
                      controller.file = result.files.first;
                      if (controller.file!.bytes != null) {
                        controller.adddata(controller.file);
                      } else {
                        print('No data available in file');
                      }
                    } else {
                      print('User canceled the picker');
                    }
                  },
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: controller.sliderresponse.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
                          child: Container(
                            height: 128,
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
                                            "${ApiLinks.sliderimages}/${controller.sliderresponse[index]['slider_image']}",
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
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  // textDirection: TextDirection.rtl,
                                                  '${controller.sliderresponse[index]['slider_id']}',
                                                  style: thesubTitle,
                                                ),
                                                Spacer(),
                                                IconButton(
                                                    splashRadius: 0.1,
                                                    onPressed: () {
                                                      deleteDialog(
                                                          title: "تنبيه",
                                                          middleText:
                                                              "هل أنت متأكد من أنك تريد أن تحدف هذا المنتج",
                                                          onPressed: () {
                                                            controller.deletedata(
                                                                "${controller.sliderresponse[index]['slider_id']}",
                                                                "${controller.sliderresponse[index]['slider_image']}");
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
