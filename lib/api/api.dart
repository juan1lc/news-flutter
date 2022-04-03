class API {

  // ****************** 服务器信息 ***********************
  static final String protocol = 'http://';
  static final String hostName = '172.21.34.83'; // 服务器IP地址 （本机模拟器使用）
  //static final String hostName = 'bju.server.hzwei.top'; // 服务器IP地址 手机（真机）使用
  static final int port = 8080;
  //static final String appName = 'news-springboot'; // app name
  static const String baseUri = 'http://172.21.34.83:8080'; // 基本路径地址（本机模拟器使用）
  //static final String baseUri = '$protocol$hostName/$appName'; // 基本路径地址 手机（真机）使用




  //  ******************** 用户相关 ********************
  /// 账号密码登录 === [POST]
  static const String findUserAPI = '$baseUri/login/by-name';
  /// 新用户注册接口 === [POST]
  static const String registerAPI = '$baseUri/register';
  /// 修改用户信息接口 === [PUT]
  static const String updateUserInfo = '$baseUri/users/info/edit';
  /// 根据用户id查找用户信息 === [GET]+/id
  static const String findUserById = '$baseUri/users';

  //  ******************** 动态相关 ********************
  /// 动态发布接口 === [POST]
  static const String publishPost = '$baseUri/posts/publish-post';
  /// 获取用户全部动态接口 === [GET]
  static const String getUserPosts = '$baseUri/posts/user-posts';
  /// 获取某标签下最新动态 === [GET]
  static const String getTagLatestPosts = '$baseUri/posts/tags';
  /// 获取用户全部草稿接口 === [GET]
  static const String getUserDrafts = '$baseUri/posts/user-drafts';
  /// 发布草稿接口 === [PUT]
  static const String publishDrafts = '$baseUri/posts/publish-draft';

  /// 点赞动态接口 === [POST]
  static const String likePost = '$baseUri/posts/like';
  /// 点赞某动态的所有用户接口 === [GET]
  static const String postLikers = '$baseUri/posts/all-likers';

  //  ******************** 文章相关 ********************
  /// 获取首页全部文章接口 === [GET]
  static const String getAllArticles = '$baseUri/articles/all';
  /// 获取某文章的详情页 === [GET]
  static const String getArticleDetail = '$baseUri/articles/detail';

  //  ******************** 标签相关 ********************
  /// 获取标签接口 === [GET]
  static final String allTags = '$baseUri/tags/list';

  /// 用户中心计数项接口 === [GET]
  static final String allCounts = "$baseUri/user/info/counts";




  /// 添加评论 === [POST]
  static final String addComment = '$baseUri/moving/comment/add';

  /// 模糊搜索@用户列表 === [GET]
  static final String searchAtUser = '$baseUri/user/fuzzy';

  /// 按照id获取用户信息（路径参数）=== [GET]
  static final String getUserInfoById = '$baseUri/user/info/';

  /// 校园新闻地址
  static final String campusNews = 'http://www.bjwlxy.edu.cn/index/xwdt/xyzx.htm';

  /// 平台系统用户默认头像地址
  static final String defaultAvatarURL = '$baseUri/static/avatars/default_avatar.jpg';

  /// 模糊搜索动态信息({searchKeyword}) === [GET]
  static final String fuzzySearchMoving = '$baseUri/moving/fuzzy/';

  /// 按照模块ID获取动态信息（{moduleId}） === [GET]
  static final String queryMovingByModuleId = '$baseUri/moving/module/';

  /// 退出登录APP == [POST]
  static final String logout = '$baseUri/passport/login/logout';

  /// 动态浏览量更新 === [PUT]
  static final String updateBrowseCount = '$baseUri/refresh/browse';

  /// 动态点赞量及点赞用户列表的更新 === [PUT]
  static final String updateMovingLikeData = '$baseUri/moving/refresh/like';

  /// 评论点赞量及点赞用户列表的更新 === [PUT]
  static final String updateCommentLikeData = '$baseUri/moving/comment/like';

  /// 动态图片访问的URL前缀
  static final String movingImagesBaseUrl = '$baseUri';

  /// 用户密码修改 === [PUT]
  static final String modifyPassword = '$baseUri/user/safe/password/modify';

  /// 用户头像修改 === [POST]
  static final String modifyAvatar = '$baseUri/user/info/avatar';

  /// 获取指定用户所有已发布的动态 === [GET]
  /// * 路径参数 userId
  static final String allMovingWithUser = '$baseUri/moving/published/';

  /// 获取指定用户草稿箱 === [GET]
  /// * 路径参数 userId
  static final String draftMovingWithUser = '$baseUri/moving/draft/';

  /// 保存动态到草稿箱 === [POST]
  /// * multipart/form-data
  static final String saveDraftMoving = '$baseUri/moving/temporary';

  /// 重新发布动态（草稿箱中的）=== [PUT]
  /// * 路径参数 movingId
  static final String republishMoving = '$baseUri/moving/republish/';

  /// 删除动态（已发布or草稿箱）=== [DELETE]
  /// * 路径参数 movingId
  static final String deleteMoving = '$baseUri/moving/delete/';


}