

import 'package:flutter/foundation.dart';
import 'package:newsapp/model/categorymodel.dart';

List<CategoryModel> getCategories() {
  //new list
  List<CategoryModel> categories = [];

  categories.add(
    CategoryModel(
      categoryName: "Entertainment",
      imageUrl: 'https://media.licdn.com/dms/image/C4E1BAQGlTBGCd2gshQ/company-background_10000/0/1623800046639/live_nation_cover?e=2147483647&v=beta&t=JgrFHk2DWtNVivTs5hMKtICSqRN5RQwYVT9Rzv5PJow',
    ),
  );

  categories.add(
    CategoryModel(
      categoryName: "Business",
      imageUrl: 'https://online.hbs.edu/Style%20Library/api/resize.aspx?imgpath=/PublishingImages/overhead-view-of-business-strategy-meeting.jpg&w=1200&h=630',
    ),
  );

  categories.add(
    CategoryModel(
      categoryName: "Sports",
      imageUrl: 'https://www.timeshighereducation.com/student/sites/default/files/styles/default/public/different_sports.jpg?itok=CW5zK9vp',
    ),
  );

  categories.add(
    CategoryModel(
      categoryName: "General",
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQyPwwvQW8LTQFvrVqIHw-j6xK1Bt-0wA3_w&usqp=CAU',
    ),
  );

  categories.add(
    CategoryModel(
      categoryName: "Health",
      imageUrl: 'https://blog.ipleaders.in/wp-content/uploads/2020/01/Health-Insurance.jpg',
    ),
  );

  categories.add(
    CategoryModel(
      categoryName: "Science",
      imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/022/006/596/small_2x/science-background-illustration-scientific-design-flasks-glass-and-chemistry-physics-elements-generative-ai-photo.jpeg',
    ),
  );

  return categories;
}

