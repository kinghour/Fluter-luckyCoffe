import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:luckycoffe/common/customAppbar.dart';
import 'package:luckycoffe/common/httpRequst/dioUtils.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/pages/menu/widget/product.dart';
import 'package:provider/provider.dart';

import '../../../common/macros.dart';
import '../Model/leftClassModel.dart';
import '../Model/rightProductModel.dart';
import '../widget/classifyTitle.dart';
import '../Model/leftClassModel.dart';
import '../widget/leftItems.dart';
import '../Model/rightProductModel.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List bananerArr = ['/menu/bannar1.png', '/menu/bannar2.jpg'];

  RightProductModel rightModel = RightProductModel();
  LeftClassModel clasesModel = LeftClassModel();

  List<Widget> productList = [];

  int leftSelectId;

  final ScrollController _nestedScrollController = new ScrollController();

  static double _nestedScrollOffet = 0;

  var _buildFuture;

  //请求分类菜单

//  Future getData() async {
//    return Future.wait([getClassifyModel()]);
//  }

  Future<Response> getClassifyModel() async {
    DioUtils.getHttp('/shop/goods/category/all', parameters: {"11": "11"},
        onSuccess: (response) {
      LeftClassModel dataModel = LeftClassModel.fromJson(response.data);

      this.clasesModel.setData(dataModel.data);

      getProductModel(dataModel);
      print('111');
      return response;
    }, onError: (error) {
      print('');
    });
    return null;
  }

  //请求产品列表
  Future<RightProductModel> getProductModel(
      LeftClassModel classifyModel) async {
    DioUtils.testPost('shop/goods/list', parameters: {"111": '11'},
        onSuccess: (data) {
      List<Widget> productList = [];

      RightProductModel proModel = RightProductModel.fromJson(data);
      this.rightModel = proModel;

      classifyModel.data.forEach((ClasesModel classModel) {
        productList.add(
          ClassifyTitle(
            title: classModel.name,
            desc: '瑞幸生活 美好咖啡',
          ),
        );

        proModel.data.forEach((ProductModel model) {
          if (classModel.id == model.categoryId) {
            productList.add(ProductWidget(model: model));

          }
        });
      });

      setState(() {
        this.productList = productList;
      });
    }, onError: (error) {
      print(error);
    });
  }

  @override
  void initState() {


    //添加监听，获取偏移量
    _nestedScrollController.addListener(() {
      setState(() {
        _nestedScrollOffet = _nestedScrollController.offset;
      });
    });

    _buildFuture = getClassifyModel();
    super.initState();
  }

  @override
  void dispose() {
    //必须释放监听
    _nestedScrollController.dispose();
    super.dispose();
  }

  Widget bodyWidget() {
    return SafeArea(
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  expandedHeight: adpHeight(130),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    ///FlexibleSpaceBar AppBar的一部分，它可以扩展，折叠，延伸控件
                    background: Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Opacity(
                        //蒙层效果
                        opacity: 1, //透明度
                        ///此处是被折叠的部分
                        child: Swiper(
                            itemCount: this.bananerArr.length,
                            autoplay: true,
                            pagination: new SwiperPagination(),
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset(
                                imagePath(this.bananerArr[index]),
                                fit: BoxFit.fill,
                              );
                            }),
                      ),
                    ),
                  ))
            ];
          },
          body: Container(
            padding: EdgeInsets.only(
                top: _nestedScrollOffet >= adpHeight(130)
                    ? (_nestedScrollOffet - adpHeight(130))
                    : 0),
            child: Row(
              children: <Widget>[
                ///左侧商品分类选择
                Consumer(builder: (BuildContext context,
                    LeftClassModel classModel, Widget child) {
                  return LeftItems(
                    classModel.data,
                    seletcId: this.leftSelectId,
                    onPress: (menuModel) {
                      if (this.leftSelectId != menuModel.id) {
                        List<Widget> productList = [];

                        this.clasesModel.data.forEach((ClasesModel classModle) {
                          if (menuModel.id == classModle.id) {
                            productList.add(
                              ClassifyTitle(
                                title: classModle.name,
                                desc: null,
                              ),
                            );

                            this.rightModel.data.forEach((ProductModel model) {
                              if (menuModel.id == model.categoryId) {
                                productList.add(ProductWidget(model: model));
                              }
                            });
                          }
                        });

                        setState(() {
                          this.leftSelectId = menuModel.id;
                          this.productList = productList;
                        });
                      }
                      print('点击 ${menuModel.name}');
                    },
                  );
                }),

                ///右侧商品列表
                Container(
                  margin: EdgeInsets.only(left: 0, top: 0),
                  width: screenW() - adpWidth(90),
                  child: ListView(
                    physics: _nestedScrollOffet >= adpHeight(130)
                        ? BouncingScrollPhysics()
                        : ClampingScrollPhysics(),
                    children: this.productList,
                  ),
                )
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => this.clasesModel,
      child: Scaffold(
        appBar: CustAppBar(
          context,
          title: '选择咖啡喝小食',
          isShowBackButton: false,
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: _buildFuture,
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              } else if (snapShot.connectionState == ConnectionState.done) {
                if (snapShot.hasError) {
                  return Text('Error: ${snapShot.error}');
                }
                return bodyWidget();
              } else {
                return Text('网络错误');
              }
            }),
      ),
    );
  }
}
