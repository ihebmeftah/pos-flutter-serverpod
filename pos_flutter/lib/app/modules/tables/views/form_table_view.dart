import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/components/app_section_card.dart';

import '../../../components/apperrorscreen.dart';
import '../../../components/appformfield.dart';
import '../controllers/form_table_controller.dart';

class FormTableView extends GetView<FormTableController> {
  const FormTableView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Create Tables'), centerTitle: true),
      body: controller.obx(
        (s) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    children: [
                      ...List.generate(
                        controller.tables.length,
                        (index) => AppSectionCard(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                spacing: 20,
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey.shade300,
                                      height: 40,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Zone ${index + 1}",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleLarge,
                                      ),
                                      if (controller.tables.length > 1)
                                        IconButton(
                                          style: IconButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                            foregroundColor: Colors.red,
                                          ),
                                          onPressed: () =>
                                              controller.removeZone(index),
                                          icon: const Icon(Icons.delete),
                                        ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey.shade300,
                                      height: 60,
                                    ),
                                  ),
                                ],
                              ),
                              Form(
                                key: controller.tables[index].tableformKey,
                                child: Column(
                                  spacing: 10,
                                  children: [
                                    AppFormField.label(
                                      label: "Table number",
                                      ctr: controller.tables[index].nb,
                                      isNumeric: true,
                                      pIcon: IconButton(
                                        onPressed: controller
                                            .tables[index]
                                            .incrementNb,
                                        icon: const Icon(Icons.add),
                                      ),
                                      sIcon: IconButton(
                                        onPressed: controller
                                            .tables[index]
                                            .decrementNb,
                                        icon: const Icon(Icons.remove),
                                      ),
                                    ),
                                    AppFormField.label(
                                      label: "Number of Seats",
                                      ctr: controller.tables[index].nbSeat,
                                      isNumeric: true,
                                      pIcon: IconButton(
                                        onPressed: controller
                                            .tables[index]
                                            .incrementNbSeat,
                                        icon: const Icon(Icons.add),
                                      ),
                                      sIcon: IconButton(
                                        onPressed: controller
                                            .tables[index]
                                            .decrementNbSeat,
                                        icon: const Icon(Icons.remove),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: controller.addZone,
                        child: Text(
                          "Add Zone Number ${controller.tables.length + 1}",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: ElevatedButton(
                  onPressed: controller.createTables,
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
        onError: (e) => AppErrorScreen(message: e),
      ),
    );
  }
}
