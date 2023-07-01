import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/modules/syllabus/syllabusController.dart';

import '../../data/helperWidget/appDimensions.dart';
import '../../data/helperWidget/appHelperWidget.dart';


class SyllabusView extends StatelessWidget {
  const SyllabusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SyllabusController>(
        init: SyllabusController(),
        builder: (syllabusController) {
          return Scaffold(
            appBar: AppHelperWidget().appBar(),
            body: Stack(
              children: [
                if (syllabusController.testData != null) ...{
                  ListView.builder(
                    itemCount:
                    syllabusController.testData!.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>Container(
                      margin: EdgeInsets.symmetric(vertical: AppDimensions().h05),
                      padding: EdgeInsets.symmetric(horizontal: AppDimensions().h05),
                      decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(Get.context!).primaryColor)),
                      child: ExpansionTile(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.transparent),
                        ),
                        tilePadding: EdgeInsets.zero,
                        expandedAlignment: Alignment.centerLeft,
                        trailing: Transform.rotate(
                          angle: 1.6,
                          child: Icon(
                            size: 30,
                            Icons.send_rounded,
                            color: Theme.of(Get.context!).primaryColor,
                          ),
                        ),
                        title:Text(syllabusController.testData!.values.toList()[index].subjectName) ,
                        children:syllabusController.testData!.values.toList()[index].chapterdata.map((e) {
                          return Text(e.chapterName);
                        }).toList(),
                      ),
                    ) /*Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.assignment,
                              color: Colors.blueAccent,
                              size: 35,
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(syllabusController
                                          .syllabusModal!.data[index]!.subjectName,style: const TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),),
                                      Text(assignmentController
                                          .assignmentModal!.data[index].description)
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text("${assignmentController
                                          .assignmentModal!.data[index].date.day}-${assignmentController
                                          .assignmentModal!.data[index].date.month}-${assignmentController
                                          .assignmentModal!.data[index].date.year}"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )*/,
                  )
                } else ...{
                  const Center(
                    child: Text("No Syllabus"),
                  )
                },
                if (syllabusController.isDataLoading) ...{
                  Container(
                    alignment: Alignment.center,
                    height: Get.height,
                    width: Get.width,
                    color: Theme.of(context).disabledColor.withOpacity(0.5),
                    child: const CircularProgressIndicator(),
                  )
                }
              ],
            ),
          );
        });
  }
}
