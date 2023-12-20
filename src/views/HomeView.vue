<style scoped>
.home {
  display: flex;
  flex-direction: column;
}

.horizontal {
  width: 100%;
}

.horizontal-inner {
  margin: 18px 6px;
}

.horizontal-inner .title {
  font-size: 200%;
  text-align: center;
}

.horizontal-inner .title img {
  height: 24vh;
  display: block;
  margin: 0 auto;
  position: relative;
  border-style: none;
  box-sizing: content-box;
  max-width: 100%;
}

.horizontal-inner .title small {
  text-transform: uppercase;
  letter-spacing: 3px;
  font-weight: 100;
  line-height: 1.9rem;

  font-size: 50%;
  display: block;
  margin: 0.7em 0 0.7em;
}

.horizontal-inner .action-warp {
  display: flex;
  flex-flow: column wrap;
  font-size: 125%;
  line-height: 1.6em;
  position: relative;
  z-index: 99;
  padding: 8px 0;
}

.horizontal-inner .action-warp .action {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin: 0 -2px;
}

.horizontal-inner .action-warp .action .action-btn {
  display: block;
  padding: 0 2px;

  display: inline-block;
  padding: 6px 20px;
  margin: 0 10px;

  border: 1px solid #121020;
  border-radius: 6px;
  color: #121020;
  font-size: 14px;
  font-weight: 400;
  line-height: 1.2em;
  text-decoration: none;
  text-transform: uppercase;
  transition: background .3s, color .3s;
  cursor: pointer;
}

.horizontal-inner .action-warp .action .action-btn:hover {
  background-color: #81adce2d;
}

.horizontal-inner .desc-warp {
  font-size: .8rem;
  margin: 10px auto 0;
  max-width: 900px;
  padding: 0 20px;
  text-align: center;
  text-transform: uppercase;
}


.introduce {
  padding: 80px 40px;
  max-width: 100%;
  display: flex;
}

.introduce .introduce-item {
  flex: 1;
  align-items: center;
  justify-content: center;
  text-align: center;
  display: flex;
  flex-direction: column;
}

.introduce .introduce-item .title {
  font-weight: bold;
}

.introduce .introduce-item .desc {
  padding: 10px 36px;
  min-height: 120px;
}

.footer {
  display: flex;
}
</style>

<template>
  <div class="home">
    <div class="horizontal">
      <div class="horizontal-inner">
        <h2 class="title">
          <img :src="logo" alt="Newbility">
          <small>
            Newbility，一个完整的基础架构，用于创建基于Node.JS 平台的现代化架构软件解决方案
          </small>
        </h2>
        <div class="action-warp">
          <div class="action">
            <RouterLink class="action-btn" to="/docs">Documentation</RouterLink>
            <a href="https://github.com/Sunshine-JamesHu/newbility" class="action-btn" target="_blank">Github</a>
          </div>
        </div>
        <div class="desc-warp">
          <small>
            Newbility，一个基于Koa2的Node.js后端框架，采用模块化的方式进行构建，纯后端语义进行开发，内置基础的开发模块，并允许对内置基础模块进行重写与自定义。
            <br />
            并内置Swagger文档、Static文件目录映射、依赖注入模组、Auth模组等功能用于支持快速开发。
          </small>
        </div>
      </div>
    </div>
    <div class="introduce">
      <div class="introduce-item">
        <div class="title">
          <h2>模块化</h2>
        </div>
        <div class="desc">
          这是一个完全模块化的框架,并集成了一些很基础的组件如postgres、mysql、kafka等，并对其进行了基础的封装，允许灵活的使用并替换所需模块
        </div>
      </div>
      <div class="introduce-item">
        <div class="title">
          <h2>易用性</h2>
        </div>
        <div class="desc">
          基础模块与组件使用简单易用的API风格进行封装，异步操作全部使用async/await风格，简单易用，快速上手
        </div>
      </div>
      <div class="introduce-item">
        <div class="title">
          <h2>久经沙场</h2>
        </div>
        <div class="desc">
          在上市公司的生产环境中大面积使用，使用场景有BFF、数据流计算、亿级数据消费工具、Linux管理工具后端等
        </div>
      </div>
    </div>
    <div class="footer">

    </div>
  </div>
</template>

<script setup lang="ts">
import logo from '@/assets/logo.png'
</script>