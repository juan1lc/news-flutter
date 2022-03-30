import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/util/color.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key, required this.title,
    required this.desc, required this.img}) : super(key: key);

  final String title, desc, img;
  @override
  _TagPageState createState() => _TagPageState();
}

const List<Tab> _tabs = <Tab> [
  Tab(text:"热门动态"),
  Tab(text:"最新动态")
];
final List<Widget>_tabContent=[
  const Text('热门'),
  const Text('实时')
];

class _TagPageState extends State<TagPage> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);

    _tabController.addListener(() {
      _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            _TagHead(title: widget.title, desc: widget.desc, img: widget.img,),
            SizedBox(height: 2,),
            Container(
              color: primary,
              child: TabBar(
                controller: _tabController,
                tabs: _tabs,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-250,
              color: primary,
              child: TabBarView(
                controller: _tabController,
                  children: _tabContent
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _TagHead extends StatelessWidget {
  const _TagHead({Key? key, required this.title, required this.desc,
    required this.img}) : super(key: key);

  final String title, desc, img;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            color: loginColor,
          ),
          padding: const EdgeInsets.only(top: 120),
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget> [
            SizedBox(height:80),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              padding: const EdgeInsets.only(left:20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Image.asset(img, fit: BoxFit.cover,),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Text('# '+title+' #', style: const TextStyle(
                        color: Colors.white, fontSize: 20
                      ),),
                      const SizedBox(height: 12,),
                      Text('导语：'+ desc, style: const TextStyle(
                          color: Colors.black87, fontSize: 16
                      ),),
                      const SizedBox(height: 5,),
                      const Text('讨论量：0', style: TextStyle(
                          color: Colors.black87, fontSize: 16
                      ),),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
