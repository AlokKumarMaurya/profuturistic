import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/modules/assignment/controllers/assignmentController.dart';

import '../../../data/helperWidget/appHelperWidget.dart';

class AssignmentView extends StatelessWidget {
  const AssignmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
        init: AssignmentController(),
        builder: (assignmentController) {
          return Scaffold(
            appBar: AppHelperWidget().appBar(),
            body: Stack(
              children: [
                if (assignmentController.assignmentModal != null) ...{
                  ListView.builder(
                    itemCount:
                        assignmentController.assignmentModal!.data.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
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
                                      Text(assignmentController
                                          .assignmentModal!.data[index].subjectName,style: const TextStyle(
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
                    ),
                  )
                } else ...{
                  const Center(
                    child: Text("No Assignment pending"),
                  )
                },
                if (assignmentController.isDataLoading) ...{
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
