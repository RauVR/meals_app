import 'package:flutter/material.dart';
import 'package:meals_app/services/meal_detail_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MealItem extends StatefulWidget {
  final String mealId;

  const MealItem({super.key, required this.mealId});

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {

  MealDetailService? _mealDetailService;
  List? _mealDetail;

  initialize() async {
    _mealDetail = await _mealDetailService?.getDetails(widget.mealId)??[];
    setState(() {
      _mealDetail = _mealDetail;
    });
  }

  @override
  void initState() {
    _mealDetailService=MealDetailService();
    initialize();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final image = Image.network(_mealDetail?[0].imageUrl,fit: BoxFit.fitHeight,);

    final videoController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(_mealDetail?[0].videoUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return[
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(_mealDetail?[0].name??''),
                  background: image,
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CATEGORY : ${_mealDetail?[0].category??''}'),
                  const SizedBox(height: 10,),
                  Text('AREA : ${_mealDetail?[0].area??''}'),
                  const SizedBox(height: 10,),
                  Text('INGREDIENT : ${_mealDetail?[0].ingredient1??''} / '
                      '${_mealDetail?[0].ingredient1??''} / '
                      '${_mealDetail?[0].ingredient2??''} / '
                      '${_mealDetail?[0].ingredient3??''} / '
                      '${_mealDetail?[0].ingredient4??''} and more.'),
                  const SizedBox(height: 25,),
                  const Text('INSTRUCTIONS',style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 10,),
                  Text(_mealDetail?[0].instructions??''),
                  const SizedBox(height: 10,),
                  YoutubePlayer(controller: videoController),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
