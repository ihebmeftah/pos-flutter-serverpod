import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/components/apperrorscreen.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/extensions/currency.extension.dart';

import '../../../components/appemptyscreen.dart';
import '../../../routes/app_pages.dart';
import '../../order/controllers/pass_order_controller.dart';
import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: const Text('Articles'),
        actions: [
          if (Get.previousRoute != Routes.PASS_ORDER)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.ARTICLE_FORM);
                },
                icon: const Icon(Icons.add),
              ),
            ),
        ],
      ),
      body: controller.obx(
        (state) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.articles.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final article = controller.articles[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        article.name.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.name.capitalizeFirst!,
                            style: context.theme.textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.category_outlined,
                                size: 14,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  article.categorie!.name,
                                  style: context.theme.textTheme.bodySmall
                                      ?.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Text(
                          "${article.price} ${LocalStorage().building!.currencyCode.symbol}",
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        if (Get.previousRoute == Routes.PASS_ORDER ||
                            Get.find<PassOrderController>().table != null)
                          _addArticleWidget(index)
                        else ...[
                          Switch(
                            value: true,
                            onChanged: (value) {},
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed(
                              Routes.ARTICLE_FORM,
                              parameters: {
                                'id': article.id.toString(),
                              },
                            ),
                            child: const Text(
                              'Update',
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        onError: (error) => AppErrorScreen(message: error),
        onEmpty: controller.categoryId != null
            ? Appemptyscreen(
                message: 'No articles found for this category',
              )
            : Appemptyscreen(
                message: 'No articles found',
                pressText:
                    'Click here or tap the + button in the top right corner to add an article',
                onPressed: () => Get.toNamed(Routes.ARTICLE_FORM),
              ),
      ),
    );
  }

  Widget _addArticleWidget(int index) {
    return GetBuilder<PassOrderController>(
      id: controller.articles[index].id,
      builder: (passOrderCtr) {
        final exists = passOrderCtr.existeArticle(
          controller.articles[index].id!,
        );
        final count = passOrderCtr.countArticleOcc(
          controller.articles[index].id!,
        );
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (exists)
                IconButton(
                  onPressed: () =>
                      passOrderCtr.removeArticle(controller.articles[index]),
                  icon: const Icon(Icons.remove),
                ),
              if (exists)
                Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              IconButton(
                onPressed: () =>
                    passOrderCtr.addArticle(controller.articles[index]),
                icon: Icon(
                  Icons.add,
                  color: exists ? null : Theme.of(Get.context!).primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
