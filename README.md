# flutter_netease_cloud_music

采用**FishRedux**框架与**开源网易云音乐api**开发的高仿网易云音乐APP，技术栈主要是：Flutter+FishRedux,目前主要是偏重APP端的UI展示，主要也是借此项目强化下Flutter和FishRedux的使用，打造一个最佳实践项目。通过这个项目也可以帮助你快速使用Flutter+FishRedux开发一个属于你自己的跨平台的APP，此项目会持续更新，欢迎watch和star～

## 项目简介

本项目主要目的是学习Flutter并实现IOS和Android一套代码进行管理。状态管理采用FishRedux，实现了业务代码和UI展示的分离。
## 快速开始
- 1、配置Flutter开发环境
在真正开发之前，需要配置Flutter开发环境，本身主要是使用Mac开发的，所以如果你也是Mac的话，可以参考[Mac配置Flutter开发环](https://blog.csdn.net/longlyboyhe/article/details/110449963)
- 2、掌握Dart基本语法
- 3、掌握FishRedux的基本使用
- 4、配置接口服务
本项目主要是实现网易云音乐部分功能，接口API采用[网上开源网易云音乐API](https://binaryify.github.io/NeteaseCloudMusicApi/)，所以需要APP运行之前需要了配置接口服务。

启动后端接口服务
```
git clone https://github.com/Binaryify/NeteaseCloudMusicApi.git
cd NeteaseCloudMusicApi
npm i
npm run start
```
成功运行，效果如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210326180530614.png)

## 功能列表
- [x] 用户登陆
- [x] 退出登陆
- [x] 我的动态列表
- [x] 最近播放列表
- [ ] 我的电台
- [ ] 我的收藏
- [x] 今日推荐
- [x] 我创建的歌单列表
- [x] 我收藏的歌单列表
- [ ] 共用的歌单详情列表
- [ ] 歌曲播放页面
- [ ] 歌词滚动
- [ ] 歌曲切换播放模式（随机播放/单曲循环/顺序播放）
- [ ] 切换上一首/下一首
- [ ] 喜欢/取消喜欢某首歌曲
- [ ] 评论列表
- [ ] 视频播放
- [ ] 热搜列表
- [ ] 搜索（包含单曲/歌单/视频/歌手/专辑/电台/用户）
- [x] 统一的播放组件，方便进行切换页面后可以随时进入到播放页面

## 目录结构简要介绍
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210326181159147.png)

## 效果图
1、登陆
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210326172717996.png)
2 发现
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210326172720201.png)
3、我的
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210326172718316.png)
4、动态
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210326172718733.png)
5 每日推荐
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210326172719651.png)

## 有待完善部分
还有一些功能点以及细节都还有待进一步完善，目前先把大致主要的功能进行了下实现，当然如果发现什么问题，欢迎能够提交issues,发现之后我会及时进行更正,
欢迎 star 和 fork，感谢大家支持 🙏。
